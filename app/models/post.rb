class Post < ApplicationRecord
  paginates_per 5

  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true, length: {minimum: 15}

end
