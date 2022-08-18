class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    # booking.offer.user
    record.offer.user == user
  end

  def destroy?
    record.user == user
  end
end
