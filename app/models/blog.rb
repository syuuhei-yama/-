class Blog < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :comments
end
