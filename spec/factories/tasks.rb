FactoryBot.define do
  factory :task do
    user

    assignee { user }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
