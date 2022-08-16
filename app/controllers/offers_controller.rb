class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def show
  end
end
