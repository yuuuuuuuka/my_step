FactoryBot.define do
  factory :profile do
    height { 170.0 }
    weight { 65 }
    goal_weight { 60.0 }
    association :user
  end
end
