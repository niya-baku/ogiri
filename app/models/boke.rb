class Boke < ApplicationRecord
  def odai
   return Odai.find_by(id: self.id)
 end


  mount_uploader :image, ImageUploader
end
