class House < ActiveRecord::Base
  validates :name, :address1, :city, :state, :zip, :country, presence: true

  belongs_to :user
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :units

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  has_attached_file :image, styles: { large: "1500x1000>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image,
		presence: true,
		content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
		size: { in: 0..10.megabytes }

  def address
    "#{address1}, #{city} #{state} #{zip}"
  end
end
