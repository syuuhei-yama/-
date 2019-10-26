class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :photo_comments
  has_many :favorite_blogs,dependent: :destroy
  has_many :favorite_photos, dependent: :destroy
  attachment :profile_image
end

