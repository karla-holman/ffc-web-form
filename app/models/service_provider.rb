class ServiceProvider < ActiveRecord::Base
  validates :name, presence: true
end
