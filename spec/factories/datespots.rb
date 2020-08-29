FactoryBot.define do
  factory :datespot do
    name { Faker::Restaurant.name }
    place { 0 }
    range { 0 }
    keyword { "焼き鳥" }
    point { "シックな店内で落ち着いた雰囲気のお店" }
    caution { "お酒の種類は少ない" }
    association :user
    created_at { Time.current }
  end

  trait :picture do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_datespot.jpg')) }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end
end
