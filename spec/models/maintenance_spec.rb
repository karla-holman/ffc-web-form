require 'rails_helper'

RSpec.describe Maintenance, type: :model do
  let!(:maintenance) { Fabricate :maintenance }
  
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :priority }
  it { is_expected.to validate_presence_of :status }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :house_id }

  it { is_expected.to have_attached_file(:image) }
  it { is_expected.to validate_attachment_presence(:image) }
  it { is_expected.to validate_attachment_content_type(:image).
                allowing(%w(image/jpeg image/jpg image/png image/gif)).
                rejecting(%w(application/pdf application/msword text/plain)) }
  it { is_expected.to validate_attachment_size(:image).
                less_than(10.megabytes) }

  it { is_expected.to belong_to :house }
end
