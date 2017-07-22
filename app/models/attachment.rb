class Attachment < ActiveRecord::Base
  validates :name, :description, :page_id, presence: true

  belongs_to :page

  has_attached_file :file_attachment
  validates_attachment :file_attachment,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif application/pdf application/msword text/plain) },
		size: { in: 0..10.megabytes }
end
