class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @passenger = Passenger.find(params[:passenger_id])
    @bookings = @passenger.bookings
    render 'passengers/show'
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @passenger = Passenger.find(params[:passenger_id])
    @flight = Flight.find(params[:flight_id])
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.code = generate_code

    respond_to do |format|
      if @booking.save
        BookingMailer.success(@booking).deliver_now
        format.html { redirect_to passenger_path(@booking.passenger), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_code
    o = [(0..9), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0..7).map { o[rand(o.length)] }.join
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:flight_id, :passenger_id)
    end

    def generate_code
      o = [(0..9), ('A'..'Z')].map { |i| i.to_a }.flatten
      (0..7).map { o[rand(o.length)] }.join
    end
end
