class Review < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :rating, numericality: { only_integer: true, in: 1..5 }
end
