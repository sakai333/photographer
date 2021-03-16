require 'rails_helper'

RSpec.describe Contest, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:contest)).to be_valid
  end
end
