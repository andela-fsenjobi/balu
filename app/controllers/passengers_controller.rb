class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /passengers
  # GET /passengers.json
  def index
    @passengers = Passenger.includes(:bookings)
  end

  # GET /passengers/1
  # GET /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  # POST /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)

    if Passenger.exists?(email: @passenger.email)
      @passenger = Passenger.find_by(email: @passenger.email)
      if params.require(:passenger).permit(:flight_id)
        redirect_to new_passenger_booking_path(@passenger, params.require(:passenger).permit(:flight_id))
      end
    else
      if @passenger.save
        if params.require(:passenger).permit(:flight_id)
          redirect_to new_passenger_booking_path(@passenger, params.require(:passenger).permit(:flight_id))
        else
          redirect_to passenger_path(@passenger)
        end
      end
    end
  end
  #

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: "Passenger was successfully updated." }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: "Passenger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def passenger_params
    params.require(:passenger).permit(:name, :email, :phone, :address)
  end
end
