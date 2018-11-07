class Odai < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 255}}
  validates :user_id, {presence: true}
  
  mount_uploader :image, ImageUploader
end
