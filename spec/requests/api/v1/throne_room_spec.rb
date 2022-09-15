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

      expect(throne[:attributes][:name]).to be_a(String)
      expect(throne[:attributes][:address]).to be_a(String)
      expect(throne[:attributes][:latitude]).to be_a(Float)
      expect(throne[:attributes][:longitude]).to be_a(Float)
      expect(throne[:attributes][:directions]).to be_a(String)
      expect(throne[:attributes][:baby_changing_station]).to be_a(Boolean)
      expect(throne[:attributes][:bathroom_style]).to be_a(Integer)
      expect(throne[:attributes][:key_code_required]).to be_a(Boolean)
    end
  end

  it 'can get one throne by its id' do

    id = create(:item, merchant_id: merchant_id).id

    get "/api/v1/items/#{id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    item = response_body[:data]

    expect(response).to be_successful
    expect(item).to have_key(:id)
    expect(item).to have_key(:attributes)

    expect(item[:attributes][:name]).to be_a(String)
    expect(item[:attributes][:description]).to be_a(String)
    expect(item[:attributes][:unit_price]).to be_a(Float)
    expect(item[:attributes][:merchant_id]).to be_a(Integer)
  end

  it 'can create an item' do
    create_list(:merchant, 1)
    get '/api/v1/items'

    item_params = ({
                name: 'Super Big Big Mac',
                description: 'Burger',
                unit_price: '50.0',
                merchant_id: Merchant.first.id
              })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price.to_s).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  it 'can update an item' do
    merchant_id = create(:merchant).id
    id = create(:item, merchant_id: merchant_id).id

    item_params = { name: "Book" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate(item: item_params, merchant_id: merchant_id)
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item[:name]).to eq("Book")
  end

  it 'can delete an item' do
    merchant_id = create(:merchant).id
    id = create(:item, merchant_id: merchant_id).id
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
