class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

end
