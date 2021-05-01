require 'rails_helper'

RSpec.describe Topic, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:topic)).to be_valid
  end

  # 文章がなければ無効な状態であること
  it "is invalid without content" do
    topic = FactoryBot.build(:topic, content: nil)
    topic.valid?
    expect(topic.errors[:content]).to include("can't be blank")
  end
end
