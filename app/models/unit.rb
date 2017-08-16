class Unit < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :house

  has_attached_file :lease
  validates_attachment :lease,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif application/pdf application/msword text/plain) },
		size: { in: 0..10.megabytes }
end
