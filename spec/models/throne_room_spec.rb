require 'rails_helper'

RSpec.describe ThroneRoom, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:directions)}
    it { should validate_presence_of(:baby_changing_station)}
    it { should validate_presence_of(:bathroom_style)}
    it { should validate_presence_of(:key_code_required)}
  end

  describe 'relationships' do
    it { should have_many(:reviews) }
  end

  describe 'close_to' do
    it 'shows the 3 closests locations' do 
      throne_room_1 = ThroneRoom.create!(name: "walmart bathroom", address: "6675 business center dr, highlands ranch, co 80130", directions: "that way", baby_changing_station: 0, bathroom_style: 1, key_code_required: 1)
      throne_room_2 = ThroneRoom.create!(name: "best buy bathroom", address: "6707 s vine st ste d, centennial, co 80122", directions: "this way", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)
      throne_room_3 = ThroneRoom.create!(name: "barnes and noble bathroom", address: "6300 s main st suite N101, aurora, co 80016", directions: "over yonder", baby_changing_station: 1, bathroom_style: 0, key_code_required: 1)
      throne_room_4 = ThroneRoom.create!(name: "target bathroom", address: "10001 commons st, lone tree, co 80124", directions: "over there", baby_changing_station: 1, bathroom_style: 1, key_code_required: 0)
      throne_room_5 = ThroneRoom.create!(name: "walgreens bathroom", address: "4175 e wildcat reserve pkwy, highlands ranch, co 80126", directions: "over here", baby_changing_station: 1, bathroom_style: 1, key_code_required: 1)

      expect(ThroneRoom.close_to[0]).to eq(throne_room_5)
      expect(ThroneRoom.close_to[1]).to eq(throne_room_4)
      expect(ThroneRoom.close_to[2]).to eq(throne_room_1)
    end

  end

end
