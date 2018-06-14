FactoryBot.define do
  factory :room do
    title { Faker::Lorem.word }
    building { Faker::Lorem.word }
    capacity { Faker::Number.number(2) }
  end
end
