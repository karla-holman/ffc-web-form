class ServiceProvider < ActiveRecord::Base
  validates :name, presence: true

  has_many :houses
end
