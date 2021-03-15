FactoryBot.define do
  factory :user do
    name { "Sakai Kenta" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "example1234" }
  end
end
