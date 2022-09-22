# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
t1 = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1)
t1r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t1.id, user_id: Faker::Number.between(from: 1, to: 5))
t1r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t1.id, user_id: Faker::Number.between(from: 1, to: 5))


t2 = ThroneRoom.create(name: "best buy bathroom", address: "6707 s vine st ste d, centennial, co 80122", directions: "this way", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
t2r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t2.id, user_id: Faker::Number.between(from: 1, to: 5))
t2r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t2.id, user_id: Faker::Number.between(from: 1, to: 5))


t3 = ThroneRoom.create(name: "barnes and noble bathroom", address: "6300 s main st suite N101, aurora, co 80016", directions: "over yonder", baby_changing_station: 1, bathroom_style: 0, key_code_required: 1)
t3r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t3.id, user_id: Faker::Number.between(from: 1, to: 5))
t3r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t3.id, user_id: Faker::Number.between(from: 1, to: 5))


t4 = ThroneRoom.create(name: "Revival Denver Public House", address: "630 E 17th Ave, Denver, CO 80203", directions: "over by the bathroom", baby_changing_station: 0, bathroom_style: 1, key_code_required: 0)
t4r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t4.id, user_id: Faker::Number.between(from: 1, to: 5))
t4r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t4.id, user_id: Faker::Number.between(from: 1, to: 5))


t5 = ThroneRoom.create(name: "Tune Skateboard", address: "1623 Pearl St, Denver, CO 80203", directions: "over by the park", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
t5r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t5.id, user_id: Faker::Number.between(from: 1, to: 5))
t5r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t5.id, user_id: Faker::Number.between(from: 1, to: 5))


t6 = ThroneRoom.create(name: "Denver Botanic Gardens", address: "1007 York St, Denver, CO 80206", directions: "in the garden", baby_changing_station: 1, bathroom_style: 3, key_code_required: 1)
t6r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t6.id, user_id: Faker::Number.between(from: 1, to: 5))
t6r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t6.id, user_id: Faker::Number.between(from: 1, to: 5))


t7 = ThroneRoom.create(name: "Blue Pan Pizza", address: "3509 E 12th Ave, Denver, CO 80206", directions: "in the garden", baby_changing_station: 1, bathroom_style: 2, key_code_required: 0)
t7r1 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t7.id, user_id: Faker::Number.between(from: 1, to: 5))
t7r2 = Review.create(cleanliness: Faker::Number.between(from: 1, to: 5), ambiance: Faker::Number.between(from: 1, to: 5), tp_quality: Faker::Number.between(from: 1, to: 5), privacy: Faker::Number.between(from: 1, to: 5), accessibility: Faker::Number.between(from: 1, to: 5), other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), throne_room_id: t7.id, user_id: Faker::Number.between(from: 1, to: 5))
