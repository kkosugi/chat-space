FactoryGirl.define do

  p = Faker::Internet.password(8)
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password p
    password_confirmation p
  end

end
