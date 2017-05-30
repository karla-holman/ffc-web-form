require 'rails_helper'

RSpec.describe House, type: :model do
  it { should validate_presence_of(:address1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:country) }

  describe '#address' do
    let(:house) { House.create(address1: '12345 23rd st', city: 'Seattle', state: 'WA', country: 'USA', zip: '98155') }
    it 'returns the full street address' do
      expect(house.address).to eq '12345 23rd st, Seattle WA 98155'
    end
  end
end
