class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    @review = Review.new(category_params)

    @review.product_id = params[:product_id]
    @review.user = current_user

    if @review.save

      redirect_to @product, notice: 'Review created!'
    else
      redirect_to @product
    end

  end

private

def category_params
    params.require(:review).permit(
      :rating, :description
    )
  end

end
