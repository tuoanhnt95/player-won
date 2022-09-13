class Offer < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :bookings
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_game_and_user,
                  against: :title,
                  associated_against: {
                    game: :name,
                    user: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
