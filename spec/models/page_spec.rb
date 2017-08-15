require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { Fabricate :page }
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:attachments) }
end
