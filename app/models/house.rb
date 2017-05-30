class House < ActiveRecord::Base
  validates :address1, :city, :state, :zip, :country, presence: true
end
