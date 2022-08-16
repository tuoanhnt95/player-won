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

end
