class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all.decorate
    @airports ||= Airport.includes(:city).all
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    @booking = Booking.new
    @passenger = @booking.passengers.build
  end

  def search
    @flights = Flight.search(search_params).decorate
  end

  # GET /flights/new
  def new
    @flight = Flight.new
    @airports ||= Airport.includes(:city).all
    @planes = Plane.all
  end

  # GET /flights/1/edit
  def edit
    @airports ||= Airport.includes(:city).all
    @planes = Plane.all
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
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
