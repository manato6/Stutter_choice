class Job < ApplicationRecord
  has_many :post_job, dependent: :destroy
  has_many :jobs, through: :post_job, dependent: :destroy
end
