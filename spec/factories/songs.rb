FactoryGirl.define do
  factory :song do
    name    { Faker::Name.first_name }
    length { Faker::Number }
    artist { build(:artist) }
  end
end
