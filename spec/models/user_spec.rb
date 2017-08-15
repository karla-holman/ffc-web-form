require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate :user }
  let(:admin) { Fabricate :admin_user }
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many :houses }
  it { is_expected.to validate_presence_of(:email) }
end
