FactoryGirl.define do
  factory :pothole do
    name { Faker::Lorem.sentence }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    status 'unverified'
    score { Faker::Number.digit }
    user
  end
end