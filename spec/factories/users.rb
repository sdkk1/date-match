FactoryBot.define do
  factory :user, aliases: [:follower, :followed] do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    introduction { "はじめまして。" }
    sex { 1 }
    prefecture_code { 13 }

    trait :admin do
      admin { true }
    end
  end
end
