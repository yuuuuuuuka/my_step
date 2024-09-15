FactoryBot.define do
  factory :log do
    name { 'ランニング' }
    date { Faker::Date.backward(days: 14) }
    duration { 30 }
    reps { 10 }
    memo { '適度な運動' }
    association :user
  end
end
