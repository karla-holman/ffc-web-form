class Maintenance < ActiveRecord::Base
  extend Enumerize

  belongs_to :house

  validates :title, :category, :priority, :status, :description, :house_id, presence: true

  has_attached_file :image, styles: { large: "1500x1000>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
		size: { in: 0..10.megabytes }

  enumerize :category, in: [:home_improvement, :exterior, :interior], default: :home_improvement
  enumerize :priority, in: [:low, :normal, :high, :critical], default: :low
  enumerize :status, in: [:new, :in_progress, :resolved, :deferred, :archived], default: :new
end
