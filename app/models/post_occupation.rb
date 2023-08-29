class PostOccupation < ApplicationRecord
  belongs_to :post
  belongs_to :occupation
end
