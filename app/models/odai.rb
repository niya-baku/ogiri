class Odai < ApplicationRecord
  # has_many :bokes, dependent: :destroy
  validates :content, {presence: true, length: {maximum: 255}}
  validates :user_id, {presence: true}

  def user
   return User.find_by(id: self.user_id)
 end

  mount_uploader :image, ImageUploader
end
