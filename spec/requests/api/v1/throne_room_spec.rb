require 'rails_helper'

RSpec.describe 'throne room api requests' do

  it 'sends a list of thrones' do
      VCR.use_cassette(' throne index') do
        t1 = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1)
        t2 = ThroneRoom.create(name: "best buy bathroom", address: "6707 s vine st ste d, centennial, co 80122", directions: "this way", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
        t3 = ThroneRoom.create(name: "barnes and noble bathroom", address: "6300 s main st suite N101, aurora, co 80016", directions: "over yonder", baby_changing_station: 1, bathroom_style: 0, key_code_required: 1)
      get '/api/v1/throne_rooms'

      response_body = JSON.parse(response.body, symbolize_names: true)
      thrones = response_body[:data]

      expect(response).to be_successful
      expect(thrones.count).to eq(3)

      thrones.each do |throne|
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
    end
  end

  it 'can get one throne by its id' do
    VCR.use_cassette(' throne show') do

      id = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1).id

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
  end

  it 'can create a throne' do
    VCR.use_cassette('create throne') do

      throne_room_params = ({
        name: "Tom's",
        address: "3984 Red Cedar Dr, Highlands Ranch, CO 80126",
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
      expect(created_throne.latitude).to_not eq(nil)
      expect(created_throne.longitude).to_not eq(nil)
      expect(created_throne.directions).to eq(throne_room_params[:directions])
      expect(created_throne.baby_changing_station).to eq("true")
      expect(created_throne.bathroom_style).to eq("multi-stall F")
      expect(created_throne.key_code_required).to eq("true")
    end
  end

  it 'can update a throne' do
    VCR.use_cassette(' throne update') do
      id = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1).id

      throne_room_params = { name: "Book Store" }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/throne_rooms/#{id}", headers: headers, params: JSON.generate(throne_room: throne_room_params)
      throne_room = ThroneRoom.find_by(id: id)

      expect(response).to be_successful
      expect(throne_room[:name]).to eq("Book Store")
    end
  end

  it 'can delete an item' do
    VCR.use_cassette(' throne delete') do
      id = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1).id
      expect(ThroneRoom.count).to eq(1)

      delete "/api/v1/throne_rooms/#{id}"

      expect(response).to be_successful
      expect(ThroneRoom.count).to eq(0)
      expect{ThroneRoom.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  it 'returns 404 if throne room is not found' do
    VCR.use_cassette(' throne not found') do
      throne_room = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1)
      id = 90654501

      get "/api/v1/throne_rooms/#{id}"

      expect(response).to have_http_status(404)
    end
  end

  it 'returns 404 if throne room cannot be created' do
    VCR.use_cassette(' throne no create') do
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
  end

  it 'returns 404 if throne room cannot be updated' do
    VCR.use_cassette(' throne no update') do
      id = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1).id
      previous_address = ThroneRoom.last.address
      throne_room_params = { address: "" }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/throne_rooms/#{id}", headers: headers, params: JSON.generate(throne_room:throne_room_params)
      throne_room = ThroneRoom.find_by(id: id)

      expect(response).to have_http_status(404)
    end
  end

  it 'returns 404 if throne room cannot be destroyed' do
    VCR.use_cassette(' throne no delete') do
      id = 45672987354978

      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/throne_rooms/#{id}", headers: headers

      expect(response).to have_http_status(404)
    end
  end

  it 'can order by distance from a given point' do
    # request.remote_ip = '59.152.62.114'

    VCR.use_cassette('throne distance') do
      t1 = ThroneRoom.create(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1)
      t2 = ThroneRoom.create(name: "best buy bathroom", address: "6707 s vine st ste d, centennial, co 80122", directions: "this way", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
      t3 = ThroneRoom.create(name: "barnes and noble bathroom", address: "6300 s main st suite N101, aurora, co 80016", directions: "over yonder", baby_changing_station: 1, bathroom_style: 0, key_code_required: 1)
      t4 = ThroneRoom.create(name: "Revival Denver Public House", address: "630 E 17th Ave, Denver, CO 80203", directions: "over by the bathroom", baby_changing_station: 0, bathroom_style: 1, key_code_required: 0)
      t5 = ThroneRoom.create(name: "Tune Skateboard", address: "1623 Pearl St, Denver, CO 80203", directions: "over by the park", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
      t6 = ThroneRoom.create(name: "Denver Botanic Gardens", address: "1007 York St, Denver, CO 80206", directions: "in the garden", baby_changing_station: 1, bathroom_style: 3, key_code_required: 1)
      t7 = ThroneRoom.create(name: "Blue Pan Pizza", address: "3509 E 12th Ave, Denver, CO 80206", directions: "in the garden", baby_changing_station: 1, bathroom_style: 2, key_code_required: 0)

      get '/api/v1/throne_rooms/closest_five', env: { "REMOTE_ADDR": '76.131.44.131' }

      response_body = JSON.parse(response.body, symbolize_names: true)
      thrones = response_body[:data]

      expect(thrones.count).to eq(5)
      expect(thrones[0][:attributes][:name]).to eq("barnes and noble bathroom")
      expect(thrones[1][:attributes][:name]).to eq("walmart bathroom")
      expect(thrones[2][:attributes][:name]).to eq("best buy bathroom")
      expect(thrones[3][:attributes][:name]).to eq("Blue Pan Pizza")
      expect(thrones[4][:attributes][:name]).to eq("Denver Botanic Gardens")
    end
  end

end
