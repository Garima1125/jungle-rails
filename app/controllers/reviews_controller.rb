class ReviewsController < ApplicationController

  def create
    puts review_params
    puts product
    @review = Review.new(review_params)
    @review.product = product
    @review.user = current_user
    if @review.save
        redirect_to "/products/#{product.id}", notice: "Your review was added"
      else
        redirect_to "/products/#{product.id}", notice: "Your review was not added."
      end


  end

  def review_params
      params.require(:review).permit(
        :description,
        :rating,
      )
  end

  def product 
    Product.find(params["product_id"])
  end

  def destroy
    @review = Review.find params[:review_id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}", notice: "Your review has been successfully deleted."
  end

end
