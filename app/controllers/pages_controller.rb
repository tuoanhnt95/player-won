class PagesController < ApplicationController

  def home
  end

  def dashboard
    skip_authorization
    # I booked
    @make_bookings = current_user.bookings
    # I am booked by => offers I made, and booked by someone
    @booked_by = current_user.bookings_as_owner
    # all offers I made
    @offers = current_user.offers
  end
end
