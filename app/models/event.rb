class Event < ApplicationRecord
  belongs_to :user
  has_many :contents
  has_one_attached :thumbnail
end
