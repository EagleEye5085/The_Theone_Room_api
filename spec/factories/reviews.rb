FactoryBot.define do
  factory :review do
    cleanliness { Faker::Number.between(from: 1, to: 5)}
    ambiance { Faker::Number.between(from: 1, to: 5)}
    tp_quality { Faker::Number.between(from: 1, to: 5)}
    privacy { Faker::Number.between(from: 1, to: 5)}
    accessibility { Faker::Number.between(from: 1, to: 5)}
    other_comments { Faker::Lorem.paragraph(sentence_count: 2, supplemental: true) }
    throne_room_id {ThroneRoom.first.id || association(:throne_room)}
    user_id { Faker::Number.between(from: 1, to: 5)}
  end
end
