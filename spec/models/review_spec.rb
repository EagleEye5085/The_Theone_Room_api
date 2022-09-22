require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:cleanliness) }
    it { should validate_presence_of(:ambiance) }
    it { should validate_presence_of(:tp_quality) }
    it { should validate_presence_of(:privacy) }
    it { should validate_presence_of(:accessibility) }
    it { should validate_presence_of(:other_comments) }
    it { should validate_presence_of(:throne_room_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'relationships' do
    # it { should belong_to(:user) }
    it { should belong_to(:throne_room) }
  end
end