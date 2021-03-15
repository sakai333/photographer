require 'rails_helper'

RSpec.describe Post, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:post)).to be_valid
  end

  # 文章がなければ無効な状態であること
  it "is invalid without content" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end

  # 文章がなければ無効な状態であること
  # describe "entering content" do
  #   context "when entering content" do
  #   end
  # end

  # 画像がなければ無効な状態であること
  it "is invalid without a image" do
    post = FactoryBot.build(:post, image: nil)
    post.valid?
    expect(post.errors[:image]).to include("can't be blank")
  end

  # 投稿ユーザーを持たなければ無効な状態であること
  it "is invalid without a user_id" do
    post = FactoryBot.build(:post, user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end
end
