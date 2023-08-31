class Post < ApplicationRecord
  has_one_attached :image

  has_many :post_occupations, dependent: :destroy
  has_many :occupations, through: :post_occupations, dependent: :destroy
  has_many :comments, dependent: :destroy
   belongs_to :user
   
end
