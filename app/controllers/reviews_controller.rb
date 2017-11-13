class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find params[:product_id]
    review = @product.reviews.new do |review|
      review.product_id = params[:product_id]
      review.user_id = current_user.id
      review.description = params[:review][:description]
      review.rating = params[:review][:rating]
    end
    
    if review.save
      flash[:success] = "Review saved!"
      redirect_to "/products/#{params[:product_id].to_s}"
    else
      flash[:success] = "Unable to save review."
      redirect_to "/products/#{params[:product_id].to_s}"
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to "/products/#{params[:product_id].to_s}"
  end

  private

  def require_login
    unless current_user
      flash[:error] = "Only logged in users may review products."
      redirect_to "/login"
    end
  end
end
