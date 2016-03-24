class BookingMailer < ApplicationMailer
  def success(booking)
    @booking = booking
    @flight = booking.flight
    @passenger = booking.passenger
    mail(to: @passenger.email, subject: "Flight Booking Successful")
  end
end
