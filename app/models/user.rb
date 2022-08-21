class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :offers, source: :bookings
  has_many :reviews, dependent: :destroy
  has_many :reviews_as_owner, through: :offers, source: :reviews
  has_one_attached :photo

  include PgSearch::Model
  multisearchable against: [:name]
end
