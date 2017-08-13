require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to have_attached_file(:file_attachment) }
  it { is_expected.to validate_attachment_presence(:file_attachment) }
  it { is_expected.to validate_attachment_content_type(:file_attachment).
                allowing(%w(image/jpeg image/jpg image/png image/gif application/pdf application/msword text/plain)) }
  it { is_expected.to validate_attachment_size(:file_attachment).
                less_than(10.megabytes) }

  it { is_expected.to belong_to(:attachable) }
end
