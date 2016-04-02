require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  let(:booking) { create(:booking) }
  let(:valid_booking) { create(:booking, :invalid) }
  let(:user) { booking.user }

  describe 'GET #index' do
    # it "assigns all bookings as @bookings" do
    #   get :index
    #   expect(assigns(:bookings)).to eq([booking])
    # end
    # it { expect(response).to render_template(:index) }
  end

  describe 'GET #show' do
    it "assigns the requested booking as @booking" do
      get :show, id: booking.to_param
      expect(assigns(:booking)).to eq(booking)
    end
    # it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    it "assigns a new booking as @booking" do
      get :new, flight_id: booking.flight_id
      expect(assigns(:booking)).to be_a_new(Booking)
    end
    # it { expect(response).to render_template(:new) }
  end

  describe 'GET #edit' do
    it "assigns the requested booking as @booking" do
      get :edit, id: booking.id
      expect(assigns(:booking)).to eq(booking)
    end
    # it { expect(response).to render_template(:new) }
  end

  describe 'POST #create' do
    let(:booking) { build(:booking).attributes }
    let(:invalid_booking) { build(:booking, :invalid).attributes }

    context "with valid params" do
      it "creates a new Booking" do
        booking[:flight_id] = 1
        expect do
          post :create, booking: booking
        end.to change(Booking, :count).by(1)
      end

      it "assigns a newly created booking as @booking" do
        booking[:flight_id] = 1
        post :create, booking: booking
        expect(assigns(:booking)).to be_a(Booking)
        expect(assigns(:booking)).to be_persisted
      end
      #
      # it "redirects to the created booking" do
      #   post :create, { booking: {flight_id: 1} }
      #   expect(response).to redirect_to(Booking.last)
      # end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved booking as @booking" do
        post :create, booking: invalid_booking
        expect(assigns(:booking)).to be_a_new(Booking)
      end

      it "re-renders the 'new' template" do
        post :create, booking: invalid_booking
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    let(:new_booking) { attributes_for(:booking) }
    let(:new_invalid_booking) { attributes_for(:booking) }

    context "with valid params" do
      # it "updates the requested booking" do
      #   new_booking[:flight_id] = 2
      #   put :update, { id: booking.to_param, booking: new_booking}
      #   booking.reload
      #   expect(booking.flight_id).to eq(new_booking[:flight_id])
      # end

      it "assigns the requested booking as @booking" do
        new_booking[:flight_id] = 2
        put :update, id: booking.to_param, booking: new_booking
        expect(assigns(:booking)).to eq(booking)
      end

      # it "redirects to the booking" do
      #   new_booking[:flight_id] = 2
      #   put :update, { id: booking.to_param, booking: new_booking }
      #   expect(response).to redirect_to(booking)
      # end
    end

    context "with invalid params" do
      it "assigns the booking as @booking" do
        put :update, id: booking.to_param, booking: new_invalid_booking
        expect(assigns(:booking)).to eq(booking)
      end

      # it "re-renders the 'edit' template" do
      #   put :update, { id: booking.to_param, booking: new_invalid_booking }
      #   expect(response).to render_template("new")
      # end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested booking" do
      booking = create(:booking)
      expect do
        delete :destroy, id: booking.to_param
      end.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = create(:booking)
      delete :destroy, id: booking.to_param
      expect(response).to redirect_to(bookings_url)
    end
  end
end
