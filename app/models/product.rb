class Product < ActiveRecord::Base

  has_many :reviews

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def review_total(id)
    reviews = Review.all.where("product_id = #{id}")
    if reviews.length > 0
      total = 0
      reviews.each do |review|
        total += review.rating
      end
      total /= reviews.length
      if total > 0
        "Average rating: ".concat(total.to_s)
      end
    else
      "No reviews"
    end
  end

end
