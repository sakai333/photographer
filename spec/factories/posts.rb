FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/test_sample/sample.jpg'), 'image/jpg') }
    content { "test_content" }
    association :user
  end
end
