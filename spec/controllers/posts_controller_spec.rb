require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET #index" do
    # 認可されたユーザーとして
    context "as an authorized user" do
      # 正常にレスポンスを返すこと
      it "returns http success" do
        log_in @user
        get :index
        expect(response).to have_http_status(:success)
      end
      # 200レスポンスを返すこと
      it "returns a 200 response" do
        log_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end
    # 認可されていないユーザーとして
    context "as an unauthorized user" do
      # ログインページにリダイレクトすること
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "GET #create" do
    # 認可されたユーザーとして新規投稿ができること
    it "adds a post" do
      log_in @user
      post_params = FactoryBot.attributes_for(:post)
      expect { post :create, params: { post: post_params } }.to change(@user.posts, :count).by(1)
    end
  end

  describe "GET #destroy" do
    # 認可されたユーザーとして投稿が削除できること
    it "deletes a post" do
      @post = FactoryBot.create(:post, user: @user)
      log_in @user
      expect {
        delete :destroy, params: { id: @post.id }
      }.to change(@user.posts, :count).by(-1)
    end
  end
end
