class Boke < ApplicationRecord
  # belongs_to :odai
  def odai
   return Odai.find_by(id: self.id)
 end

 def user
  return User.find_by(id: self.user_id)
 end


  mount_uploader :image, ImageUploader
end
