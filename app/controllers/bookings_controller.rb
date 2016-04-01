class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # GET /bookings
  # GET /bookings.json
  def index
    if user_signed_in?
      @bookings = current_user.bookings
      render :index
    else
      redirect_to root_path
    end
  end

  def show
  end

  def search
    @booking = Booking.search(search_params)
    render :show
  end

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
  end

  def edit
    @flight = @booking.flight
    render :new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.code = generate_code
    @booking.user_id = current_user.id if user_signed_in?
    respond_to do |format|
      if @booking.save
        mail_passengers
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def mail_passengers
    passengers = @booking.passengers
    passengers.each do |passenger|
      BookingMailer.success(passenger, @booking).deliver_now
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @flight = @booking.flight
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_code
    o = [(0..9), ("A".."Z")].map(&:to_a).flatten
    (0..7).map { o[rand(o.length)] }.join
  end

  def search_params
    params.permit(:code)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:flight_id, :code,
                                    passengers_attributes: [:id, :name, :email, :address, :phone, :_destroy])
  end

end
