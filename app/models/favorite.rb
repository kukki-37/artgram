class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :art
  
  validates_uniqueness_of :art_id, scope: :user_id
end
