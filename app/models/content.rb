class Content < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_one_attached :image
end
