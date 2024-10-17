FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@aronnax.space" }

    password { Faker::Internet.password }
    password_confirmation { password }

    trait :with_profile do
      after(:create) do |user|
        create(:profile, user: user)
      end
    end
  end
end
