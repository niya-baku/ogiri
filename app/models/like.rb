class Like < ApplicationRecord
  validates :user_id, {presence: true}
  validates :odai_id, {presence: true}
end
