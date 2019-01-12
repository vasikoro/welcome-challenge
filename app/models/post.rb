class Post < ApplicationRecord
  validates :body, presence: true, allow_blank: false
  validates :user, presence: true, allow_blank: false

  belongs_to :user
end
