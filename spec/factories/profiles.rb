FactoryBot.define do
  factory :profile do
    user

    nickname { Faker::Name.unique.name }
    time_zone { "London" }
  end
end
