class Page < ActiveRecord::Base
  validates :name, :content, presence: true
  validates :name, uniqueness: true

  has_many :attachments
end
