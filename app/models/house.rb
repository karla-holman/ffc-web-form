class House < ActiveRecord::Base
  validates :address1, :city, :state, :zip, :country, presence: true

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def address
    "#{address1}, #{city} #{state} #{zip}"
  end
end
