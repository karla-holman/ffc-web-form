class Page < ActiveRecord::Base
  validates :name, :content, presence: true
  validates :name, uniqueness: true

  has_many :attachments, as: :attachable, dependent: :destroy
end
