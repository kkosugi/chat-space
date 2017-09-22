FactoryGirl.define do
  factory :message do
    text     "こんにちは"
    image    Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/abc.png'))
    user
    group
  end
end
