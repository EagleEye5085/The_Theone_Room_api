require 'rails_helper'

RSpec.describe ThroneRoom, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:latitude)}
    it { should validate_presence_of(:longitude)}
    it { should validate_presence_of(:directions)}
    it { should validate_presence_of(:baby_changing_station)}
    it { should validate_presence_of(:bathroom_style)}
    it { should validate_presence_of(:key_code_required)}
  end

  describe 'relationships' do
    it { should have_many(:reviews) }
  end

end
