class Art < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :art
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

  def self.search(keyword)
   where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end

end