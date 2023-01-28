FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@aronnax.space" }

    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
