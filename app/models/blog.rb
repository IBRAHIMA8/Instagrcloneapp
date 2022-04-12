class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title,  presence: true, unless: :image?
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
