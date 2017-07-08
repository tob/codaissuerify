FactoryGirl.define do
  factory :artist do
    name    { Faker::Name.first_name }
    image_url { Faker::File.file_name('path/to') }
  end
end
