class Game < ApplicationRecord
  has_many :offers

  include PgSearch::Model
  multisearchable against: [:name]
end
