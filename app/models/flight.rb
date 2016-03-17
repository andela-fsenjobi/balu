class Flight < ActiveRecord::Base
  has_many :passengers
  has_many :passengers, through :booking
end
