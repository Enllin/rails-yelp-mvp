class Restaurant < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, :inclusion=> { :in => ["chinese", "italian", "japanese", "french", "belgian"] }
  before_destroy do
    @reviews = self.reviews
  end
  after_destroy do
    @reviews.each{ |review| review.destroy }
  end
end
