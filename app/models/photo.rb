class Photo < ApplicationRecord
	attachment :image
	validates :image, presence: true
	belongs_to :user
    has_many :photo_comments
    has_many :favorite_photos, dependent: :destroy
	def favorited_by?(user)
	  favorite_photos.where(user_id: user.id).exists?
	end
end
