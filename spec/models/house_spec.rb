require 'rails_helper'

RSpec.describe House, type: :model do
  let(:house) { Fabricate :house }

  it { is_expected.to validate_presence_of(:address1) }
  it { is_expected.to  validate_presence_of(:city) }
  it { is_expected.to  validate_presence_of(:state) }
  it { is_expected.to  validate_presence_of(:zip) }
  it { is_expected.to  validate_presence_of(:country) }

  it { is_expected.to have_attached_file(:image) }
  it { is_expected.to validate_attachment_presence(:image) }
  it { is_expected.to validate_attachment_content_type(:image).
                allowing(%w(image/jpeg image/jpg image/png image/gif)).
                rejecting(%w(application/pdf application/msword text/plain)) }
  it { is_expected.to validate_attachment_size(:image).
                less_than(10.megabytes) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:attachments) }
  it { is_expected.to have_many(:units) }
  it { is_expected.to have_many(:maintenances) }

  describe '#address' do
    let(:house) { House.create(address1: '12345 23rd st', city: 'Seattle', state: 'WA', country: 'USA', zip: '98155') }
    it 'returns the full street address' do
      expect(house.address).to eq '12345 23rd st, Seattle WA 98155'
    end
  end
end
