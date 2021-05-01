FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "Sakai Kenta" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "example1234" }
  end
end
