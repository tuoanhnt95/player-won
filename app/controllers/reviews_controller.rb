class ReviewsController < ApplicationController
  def create
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)
    @review.offer = @offer
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to my_reviews_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
