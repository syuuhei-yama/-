class Blog < ApplicationRecord
	attachment :image
	validates :title, presence: true
	validates :review, presence: true
	belongs_to :user
	has_many :comments
	has_many :favorite_blogs, dependent: :destroy
	def favorited_by?(user)
		favorite_blogs.where(user_id: user.id).exists?
	end
end
