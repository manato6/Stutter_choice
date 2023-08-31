class PostJob < ApplicationRecord
  belongs_to :post
  belongs_to :job
end
