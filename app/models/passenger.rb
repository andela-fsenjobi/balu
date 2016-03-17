class Passenger < ActiveRecord::Base
  has_many :bookings
  has_many :flights, through :booking
end
