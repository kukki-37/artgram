class Art < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :art_comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
  
end