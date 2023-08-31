class Post < ApplicationRecord
  has_one_attached :image

  has_many :post_jobs, dependent: :destroy
  has_many :jobs, through: :post_jobs, dependent: :destroy
  has_many :comments, dependent: :destroy
   belongs_to :user

end
