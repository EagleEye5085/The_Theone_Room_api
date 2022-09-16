FactoryBot.define do
  factory :review do
    cleanliness { Faker::Number.between(from: 1, to: 5)}
    ambiance { Faker::Number.between(from: 1, to: 5)}
    tp_quality { Faker::Number.between(from: 1, to: 5)}
    privacy { Faker::Number.between(from: 1, to: 5)}
    other_comments { Faker::Lorem.paragraph(sentence_count: 2, supplemental: true) }
    throne_room_id { ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1).id }
    user_id { Faker::Number.digit }
  end
end
