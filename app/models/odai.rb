class Odai < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 255}}
  mount_uploader :image, ImageUploader
end
