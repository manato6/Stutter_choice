class Post < ApplicationRecord
  has_one_attached :image

  has_many :post_jobs, dependent: :destroy
  has_many :jobs, through: :post_jobs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
