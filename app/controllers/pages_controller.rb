class PagesController < ApplicationController

  def home
  end

  def my_bookings
    skip_authorization
    # I booked
    @make_bookings = current_user.bookings
  end

  def my_offers
    skip_authorization
    # all offers I made
    @offers = current_user.offers
    # I am booked by => offers I made, and booked by someone
    @booked_by = current_user.bookings_as_owner
    # create new offer
    @offer = Offer.new
  end
end
