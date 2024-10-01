FactoryBot.define do
  factory :profile do
    height { 170.0 }
    weight { 65 }

    association :user
  end
end
