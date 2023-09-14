class Job < ApplicationRecord
  has_many :post_jobs, dependent: :destroy
  has_many :posts, through: :post_jobs, dependent: :destroy
end
