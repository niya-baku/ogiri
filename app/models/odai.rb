class Odai < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 255}}
  validates :user_id, {presence: true}

  def user
   return User.find_by(id: self.user_id)
 end
 
  mount_uploader :image, ImageUploader
end
