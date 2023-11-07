FactoryBot.define do
  factory :project do
    association :owner, factory: :user

    code { Faker::Code.asin[-4..] }
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
