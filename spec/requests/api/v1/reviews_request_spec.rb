require 'rails_helper'

describe 'Reviews API' do
  it 'has a list of reviews' do
    create_list(:review, 5)

    get '/api/v1/reviews'

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    reviews = response_body[:data]

    reviews.each do |review|
      expect(review).to have_key(:id)
      expect(review[:id]).to be_a(String)

      expect(review).to have_key(:attributes)
      expect(review[:attributes][:cleanliness]).to be_a(Integer)
      expect(review[:attributes][:ambiance]).to be_a(Integer)
      expect(review[:attributes][:tp_quality]).to be_a(Integer)
      expect(review[:attributes][:privacy]).to be_an(Integer)
      expect(review[:attributes][:other_comments]).to be_an(String)
      expect(review[:attributes]).to_not have_key(:created_at)
    end
  end

  it 'can get one throne_room by its ID' do
    id = create(:review).id

    get "/api/v1/reviews/#{id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    review = response_body[:data]

    expect(response).to be_successful

    expect(review).to have_key(:id)
    expect(review[:id]).to be_a(String)

      expect(review).to have_key(:attributes)
      expect(review[:attributes][:cleanliness]).to be_a(Integer)
      expect(review[:attributes][:ambiance]).to be_a(Integer)
      expect(review[:attributes][:tp_quality]).to be_a(Integer)
      expect(review[:attributes][:privacy]).to be_an(Integer)
      expect(review[:attributes][:other_comments]).to be_an(String)
      expect(review[:attributes]).to_not have_key(:created_at)
  end

  it "can create a new review and delete it" do
    review_params = ({
                    cleanliness: Faker::Number.between(from: 1, to: 5),
                    ambiance: Faker::Number.between(from: 1, to: 5),
                    tp_quality: Faker::Number.between(from: 1, to: 5),
                    privacy: Faker::Number.between(from: 1, to: 5),
                    other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
                    throne_room_id: create(:throne_room).id,
                    user_id: Faker::Number.digit 
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/reviews", headers: headers, params: JSON.generate(review: review_params)
    created_review = Review.last

    expect(response).to have_http_status(201)
    expect(created_review.cleanliness).to eq(review_params[:cleanliness])
    expect(created_review.ambiance).to eq(review_params[:ambiance])
    expect(created_review.tp_quality).to eq(review_params[:tp_quality])
    expect(created_review.privacy).to eq(review_params[:privacy])
    expect(created_review.other_comments).to eq(review_params[:other_comments])

    delete "/api/v1/reviews/#{created_review.id}"

    expect(response).to have_http_status(204)
    expect(Review.count).to eq(0)
    expect{Review.find(created_review.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "updates an existing review" do
    id = create(:review).id
    previous_cleanliness = Review.last.cleanliness
    review_params = { cleanliness: Faker::Number.positive }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/reviews/#{id}", headers: headers, params: JSON.generate({review: review_params})
    review = Review.find_by(id: id)

    expect(response).to be_successful
    expect(review.cleanliness).to_not eq(previous_cleanliness)
    expect(review.cleanliness).to eq(review.cleanliness)
  end

  it 'returns 404 if review is not found' do
    throne_room = create(:throne_room)
    id = 90654501

    get "/api/v1/reviews/#{id}"

    expect(response).to have_http_status(404)

    delete "/api/v1/reviews/#{id}"

    expect(response).to have_http_status(404)
  end

  it 'returns 404 if review cannot be created' do
    throne_room = create(:throne_room)
    review_params = ({
                    cleanliness: Faker::Number.between(from: 1, to: 5),
                    ambiance: Faker::Number.between(from: 1, to: 5),
                    tp_quality: Faker::Number.between(from: 1, to: 5),
                    privacy: Faker::Number.between(from: 1, to: 5),
                    other_comments: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
                    throne_room_id: create(:throne_room).id,
                    # user_id: Faker::Number.digit
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/reviews", headers: headers, params: JSON.generate(review: review_params)

    expect(response).to have_http_status(404)
  end

  it 'returns 404 if review cannot be updated' do
    id = create(:review).id
    previous_cleanliness = Review.last.cleanliness
    review_params = { cleanliness: " " }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/reviews/#{id}", headers: headers, params: JSON.generate({review: review_params})
    review = Review.find_by(id: id)

    expect(response).to have_http_status(404)
  end
end