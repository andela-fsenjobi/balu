class Flight < ActiveRecord::Base
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :plane
  belongs_to :airport, foreign_key: :from
  belongs_to :destination, class_name: "Airport", foreign_key: :to

  def self.search(params)
    if params
      params = params.symbolize_keys
      where(to: params[:to], from: params[:from]).
        where(departure: Time.zone.now..Time.parse(params[:date])).
        includes(:airport).all.available
    else
      find(:all).available
    end
  end

  def self.available
    where("departure > ?", Time.zone.now)
  end
end
