class Comment < ApplicationRecord
  belongs_to :post
  validates :username, presence: true, length: {minimum: 3, maximum: 15}
end
