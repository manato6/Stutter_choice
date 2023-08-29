class Occupation < ApplicationRecord
  
  has_many :post_occupations, dependent: :destroy
  has_many :posts, through: :post_occupations, dependent: :destroy
end
