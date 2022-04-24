class Art < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
  
  def self.search(keyword)
   where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  def favo?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end