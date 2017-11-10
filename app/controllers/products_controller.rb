class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = Review.new
    @reviews = Review.all.where("product_id = #{params[:id]}")
  end

end
