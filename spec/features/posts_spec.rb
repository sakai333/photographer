require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  # ユーザーは新規投稿を行う
  scenario "user creates a new project" do
    user = FactoryBot.create(:user)
    # ログイン後マイページにリダイレクトされる
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(current_path).to eq user_path(user.id)
    # 新規投稿ボタンをクリックしたら新規投稿画面にリダイレクトされる
    find("#new_post").click
    expect(current_path).to eq new_post_path
    # 新規投稿が完了する
    expect {
      attach_file "写真", "spec/test_sample/sample.jpg"
      fill_in "コメント", with: "フィーチャスペックのテスト"
      click_button "登録"
    }.to change(user.posts, :count).by(1)
  end

  # 投稿一覧画面から投稿写真をクリックすると詳細ページがmodal表示される
  scenario "detail info is desplayed when clicking each photo", js: true do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    visit posts_path
    expect(current_path).to eq posts_path
  end
end
