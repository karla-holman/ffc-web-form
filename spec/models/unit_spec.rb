require 'rails_helper'

RSpec.describe Unit, type: :model do
  let!(:unit) { Fabricate :unit }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to belong_to :house }
end
