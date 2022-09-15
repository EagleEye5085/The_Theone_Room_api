FactoryBot.define do
  factory :throne_room do
    name { Faker::Name.name}
    address { Faker::Address.street_address}
    latitude { Faker::Address.latitude}
    longitude { Faker::Address.longitude}
    directions { Faker::Address.street_name}
    baby_changing_station { Faker::Number.between(from: 0, to: 1)}
    bathroom_style { Faker::Number.between(from: 0, to: 5)}
    key_code_required { Faker::Number.between(from: 0, to: 1)}
  end
end
