class Like < ApplicationRecord
  validates :user_id, {presence: true}
  validates :boke_id, {presence: true}
end
