FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    imei '990000862471854'
    score { Faker::Number.digit }
  end
end