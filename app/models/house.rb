class House < ActiveRecord::Base
  validates :address1, :city, :state, :zip, :country, presence: true

  def address
    "#{address1}, #{city} #{state} #{zip}"
  end
end
