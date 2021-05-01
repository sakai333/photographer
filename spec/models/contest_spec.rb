require 'rails_helper'

RSpec.describe Contest, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:contest)).to be_valid
  end

  # コンテスト名がなければ無効な状態であること
  it "is invalid without content name" do
    contest = FactoryBot.build(:contest, name: nil)
    contest.valid?
    expect(contest.errors[:name]).to include("can't be blank")
  end

  # 期限がなければ無効な状態であること
  it "is invalid without period" do
    contest = FactoryBot.build(:contest, period: nil)
    contest.valid?
    expect(contest.errors[:period]).to include("can't be blank")
  end

  # 条件がなければ無効な状態であること
  it "is invalid without condition" do
    contest = FactoryBot.build(:contest, condition: nil)
    contest.valid?
    expect(contest.errors[:condition]).to include("can't be blank")
  end
end
