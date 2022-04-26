class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  validates :username, presence: true
  has_many :arts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_arts, through: :favorites, source: :art
  
  def already_favorited?(art)
    self.favorites.exists?(art_id: art.id)
  end
end