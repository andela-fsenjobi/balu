class FlightDecorator < Draper::Decorator
  delegate_all

  def airline
    object.plane.airline.name
  end

  def plane_name
    object.plane.name
  end

  def plane_capacity
    object.plane.capacity
  end

  def departure_airport
    object.airport.name
  end

  def departure_date
    object.departure.strftime("%A, %B %e %Y")
  end

  def departure_time
    object.departure.strftime("%H:%M %Z")
  end

  def departure_city
    object.airport.city.name
  end

  def departure_state
    object.airport.city.state.name
  end

  def departure_country
    object.airport.city.state.country.name
  end

  def arrival_airport
    object.destination.name
  end

  def arrival_date
    object.arrival.strftime
  end

  def arrival_time
    object.arrival.strftime("%H:%M %Z")
  end

  def arrival_city
    object.destination.city.name
  end

  def arrival_state
    object.destination.city.state.name
  end

  def arrival_country
    object.destination.city.state.country.name
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
