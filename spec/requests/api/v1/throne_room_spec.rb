require 'rails_helper'

RSpec.describe 'throne room api requests' do
  it 'sends a list of thrones' do
    create_list(:throne_room, 3)
    get '/api/v1/throne_rooms'

    response_body = JSON.parse(response.body, symbolize_names: true)
    thrones = response_body[:data]

    expect(response).to be_successful
    expect(thrones.count).to eq(3)

    thrones.each do |throne|
      expect(throne).to have_key(:id)
      expect(throne).to have_key(:attributes)
      # binding.pry

      expect(throne[:attributes][:name]).to be_a(String)
      expect(throne[:attributes][:address]).to be_a(String)
      expect(throne[:attributes][:latitude]).to be_a(Float)
      expect(throne[:attributes][:longitude]).to be_a(Float)
      expect(throne[:attributes][:directions]).to be_a(String)
      expect(throne[:attributes][:baby_changing_station]).to be_a(String)
      expect(throne[:attributes][:bathroom_style]).to be_a(String)
      expect(throne[:attributes][:key_code_required]).to be_a(String)
    end
  end

  it 'can get one throne by its id' do

    id = create(:throne_room).id

    get "/api/v1/throne_rooms/#{id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    throne = response_body[:data]

    expect(response).to be_successful
    expect(throne).to have_key(:id)
    expect(throne).to have_key(:attributes)

    expect(throne[:attributes][:name]).to be_a(String)
    expect(throne[:attributes][:address]).to be_a(String)
    expect(throne[:attributes][:latitude]).to be_a(Float)
    expect(throne[:attributes][:longitude]).to be_a(Float)
    expect(throne[:attributes][:directions]).to be_a(String)
    expect(throne[:attributes][:baby_changing_station]).to be_a(String)
    expect(throne[:attributes][:bathroom_style]).to be_a(String)
    expect(throne[:attributes][:key_code_required]).to be_a(String)
  end

  it 'can create a throne' do

    throne_room_params = ({
      name: "Tom's",
      address: "123 ST. Firgle",
      latitude: 10.837,
      longitude: 10.837,
      directions: "in the back",
      baby_changing_station: 1,
      bathroom_style: 1,
      key_code_required: 1
              })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/throne_rooms", headers: headers, params: JSON.generate(throne_room: throne_room_params)
    created_throne = ThroneRoom.last

    expect(response).to be_successful
    expect(created_throne.name).to eq(throne_room_params[:name])
    expect(created_throne.address).to eq(throne_room_params[:address])
    expect(created_throne.latitude).to eq(throne_room_params[:latitude])
    expect(created_throne.longitude).to eq(throne_room_params[:longitude])
    expect(created_throne.directions).to eq(throne_room_params[:directions])
    expect(created_throne.baby_changing_station).to eq("true")
    expect(created_throne.bathroom_style).to eq("multi-stall F")
    expect(created_throne.key_code_required).to eq("true")
  end

  it 'can update a throne' do
    id = create(:throne_room).id

    throne_room_params = { name: "Book Store" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/throne_rooms/#{id}", headers: headers, params: JSON.generate(throne_room: throne_room_params)
    throne_room = ThroneRoom.find_by(id: id)

    expect(response).to be_successful
    expect(throne_room[:name]).to eq("Book Store")
  end

  it 'can delete an item' do
    id = create(:throne_room).id
    expect(ThroneRoom.count).to eq(1)

    delete "/api/v1/throne_rooms/#{id}"

    expect(response).to be_successful
    expect(ThroneRoom.count).to eq(0)
    expect{ThroneRoom.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns 404 if throne room is not found' do
    throne_room = create(:throne_room)
    id = 90654501

    get "/api/v1/throne_rooms/#{id}"

    expect(response).to have_http_status(404)

  end

  it 'returns 404 if throne room cannot be created' do
    throne_room_params = ({
      name: "Tom's",
      address: "123 ST. Firgle",
      latitude: 10.837,
      longitude: 10.837,
      directions: "",
      baby_changing_station: 1,
      bathroom_style: 1,
      key_code_required: 1
              })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/throne_rooms", headers: headers, params: JSON.generate(throne_room: throne_room_params)

    expect(response).to have_http_status(404)
  end

  it 'returns 404 if throne room cannot be updated' do
    id = create(:throne_room).id
    previous_address = ThroneRoom.last.address
    throne_room_params = { address: "" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/throne_rooms/#{id}", headers: headers, params: JSON.generate(throne_room:throne_room_params)
    throne_room = ThroneRoom.find_by(id: id)

    expect(response).to have_http_status(404)
  end
end
