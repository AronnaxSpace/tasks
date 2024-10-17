FactoryBot.define do
  factory :profile do
    user

    nickname { Faker::Name.unique.name }
  end
end
