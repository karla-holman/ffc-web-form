class Unit < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :house
end
