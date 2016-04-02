class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = Flight.all.decorate
    @airports ||= Airport.includes(:city).all
  end

  def show
    @booking = Booking.new
    @passenger = @booking.passengers.build
  end

  def search
    @flights = Flight.search(search_params).decorate
  end

  def new
    @flight = Flight.new
    @airports ||= Airport.includes(:city).all
    @planes = Plane.all
  end

  def edit
    @airports ||= Airport.includes(:city).all
    @planes = Plane.all
  end

  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html do
          redirect_to @flight,
                      notice: "Flight was successfully created."
        end
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json do
          render json: @flight.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html do
          redirect_to @flight,
                      notice: "Flight was successfully updated."
        end
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json do
          render json: @flight.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @flight.destroy
    respond_to do |format|
      format.html do
        redirect_to flights_url,
                    notice: "Flight was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  def search_params
    params.permit(:from, :to)
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:from, :to, :departure, :arrival, :plane_id)
  end
end
