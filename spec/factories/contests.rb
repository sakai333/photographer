FactoryBot.define do
  factory :contest do
    name { "Test_contest" }
    image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/test_sample/sample.jpg'), 'image/jpg') }
    period { "2050-01-01" }
    condition { "sample" }
    association :user
  end
end
