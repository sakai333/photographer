require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  # ポスト基本機能動作テスト
  scenario "user creates a new project", js: true do
    user = FactoryBot.create(:user)
    # ログイン後マイページにリダイレクトされる
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(current_path).to eq user_path(user.id)
    # 新規投稿ボタンをクリックしたら新規投稿画面にリダイレクトされる
    find(".new_post").click
    expect(current_path).to eq new_post_path
    # 新規投稿が完了する
    expect {
      attach_file "写真", "spec/test_sample/sample.jpg"
      fill_in "コメント", with: "フィーチャスペックのテスト"
      click_button "登録"
    }.to change(user.posts, :count).by(1)
    # postsページにリダイレクトされる
    expect(current_path).to eq posts_path
    # postsページに写真が1つ表示されている
    expect(page.all(".photo_container").count).to eq 1
    # 写真をクリックすると詳細ページがmodal表示される
    find(".photo_container").click
    expect(page).to have_css ".modal_container"
    # goodボタンをクリックするといいね数が1になり、goodクラスが追加される
    within "#like_section_modal" do
      find(".fa-thumbs-up").click
      expect(page).to have_content "1"
      expect(page).to have_css ".like"
    end
    # goodボタンを再度クリックするといいね数が0になり、goodクラスがなくなる
    within "#like_section_modal" do
      find(".fa-thumbs-up").click
      expect(page).to have_content "1"
      expect(page).to_not have_css ".like"
    end
    # コメントを送信すると、コメントが表示されカウントが1になる
    find("#text_form").set("test comment")
    click_button "送信"
    expect(find("#comments_area")).to have_content "test comment"
    expect(find("#comment_num_modal")).to have_content "1"
    # コメント削除ボタンを押すと、コメントが削除されカウントが0になる
    find(".comment_delete").click
    expect(find("#comments_area")).to_not have_content "test comment"
    expect(find("#comment_num_modal")).to have_content "0"
    # 投稿削除ボタンを押すと、一覧ページの写真が無くなる
    find(".post_delete").click
    page.driver.browser.switch_to.alert.accept 
    expect(page.all(".photo_container").count).to eq 0
  end
end
