class Flight < ActiveRecord::Base
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :plane
  belongs_to :airport, foreign_key: :from
  belongs_to :destination, class_name: "Airport", foreign_key: :to

  def self.search(params)
    if params
      includes(:airport).all.where(params.symbolize_keys)
    else
      find(:all)
    end
  end
end
