FactoryGirl.define do
  factory :message do
    text     Faker::Lorem.sentence
    image    Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/abc.png'))
    user
    group
  end
end
