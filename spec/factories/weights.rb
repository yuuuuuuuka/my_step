FactoryBot.define do
  factory :weight do
    weight { 65 }
    date { Faker::Date.backward(days: 14) }
    association :user
  end
end
