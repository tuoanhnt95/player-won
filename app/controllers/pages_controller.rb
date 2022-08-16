class PagesController < ApplicationController
  def home
  end

  def dashboard
    @have_bookings = policy_scope(Booking)
    @make_bookings = policy_scope(Booking).where(user: current_user)
    @offers = policy_scope(Offer).where(user: current_user)
    # select bookings of offers where the person who creates the offers is you
  end
end
