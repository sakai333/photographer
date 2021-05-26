require 'rails_helper'

RSpec.feature "Topics", type: :feature do
  # トピック基本機能動作テスト
  scenario "user creates a new topic", js: true do
    user = FactoryBot.create(:user)
    # ログイン後マイページにリダイレクトされる
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(current_path).to eq user_path(user.id)
    # トピックスボタンをクリックしたらトピックページにリダイレクトされる
    click_link("トピックス")
    expect(current_path).to eq topics_path
    # 新規投稿ボタンをクリックしたら新規投稿画面にリダイレクトされる
    find(".new_topic").click
    expect(current_path).to eq new_topic_path
    # 新規投稿が完了する
    expect {
      attach_file "サムネイル写真", "spec/test_sample/sample.jpg"
      fill_in "タイトル", with: "sample topic"
      fill_in "コンテント", with: "sample content"
      click_button "登録"
    }.to change(user.topics, :count).by(1)
    # 新規トピックページにリダイレクトされる
    expect(page).to have_content "sample content"
    # コメントを送信すると、コメントが表示されカウントが1になる
    find("#text_form").set("test comment")
    click_button "送信"
    expect(find("#comments_area")).to have_content "test comment"
    # コメント削除ボタンを押すと、コメントが削除されカウントが0になる
    find(".comment_delete").click
    expect(page).not_to have_css "#comments_area"
    # 投稿削除ボタンを押すと、一覧ページの写真が無くなる
    find(".delete").click
    page.driver.browser.switch_to.alert.accept
    expect(current_path).to eq topics_path
    expect(page).not_to have_content "sample topic"
  end
end
