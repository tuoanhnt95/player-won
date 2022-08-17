class OffersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @booking = Booking.new
  end

  def new
    # this instance is for the form
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to dashboard_path
    else
      # render 'new.html.erb'
      # redirect_to new_restaurant_path
      render :new
    end
  end

  private

  # strong params -> whitelisting the attributes that the user can give us
  def offer_params
    params.require(:offer).permit(:title, :description, :duration, :price, :game_id)
  end
end
