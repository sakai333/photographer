FactoryBot.define do
  factory :topic do
    content { "test_content" }
    association :user
  end
end
