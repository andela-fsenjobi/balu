require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it "assigns all bookings as @bookings" do
      booking = Booking.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:bookings)).to eq([booking])
    end
    it { expect(response).to render_template(:index) }
  end

  describe 'GET #show' do
    it "assigns the requested booking as @booking" do
      booking = Booking.create! valid_attributes
      get :show, { id: booking.to_param }, valid_session
      expect(assigns(:booking)).to eq(booking)
    end
    it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    it "assigns a new booking as @booking" do
      get :new, {}, valid_session
      expect(assigns(:booking)).to be_a_new(Booking)
    end
    it { expect(response).to render_template(:new) }
  end

  describe 'GET #edit' do
    it "assigns the requested booking as @booking" do
      booking = Booking.create! valid_attributes
      get :edit, { id: booking.to_param }, valid_session
      expect(assigns(:booking)).to eq(booking)
    end
    it { expect(response).to render_template(:edit) }
  end

  describe 'POST #create' do
    context "with valid params" do
      it "creates a new Booking" do
        expect do
          post :create, { booking: valid_attributes }, valid_session
        end.to change(Booking, :count).by(1)
      end

      it "assigns a newly created booking as @booking" do
        post :create, { booking: valid_attributes }, valid_session
        expect(assigns(:booking)).to be_a(Booking)
        expect(assigns(:booking)).to be_persisted
      end

      it "redirects to the created booking" do
        post :create, { booking: valid_attributes }, valid_session
        expect(response).to redirect_to(Booking.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved booking as @booking" do
        post :create, { booking: invalid_attributes }, valid_session
        expect(assigns(:booking)).to be_a_new(Booking)
      end

      it "re-renders the 'new' template" do
        post :create, { booking: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    context "with valid params" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested booking" do
        booking = Booking.create! valid_attributes
        put :update, { id: booking.to_param, booking: new_attributes }, valid_session
        booking.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested booking as @booking" do
        booking = Booking.create! valid_attributes
        put :update, { id: booking.to_param, booking: valid_attributes }, valid_session
        expect(assigns(:booking)).to eq(booking)
      end

      it "redirects to the booking" do
        booking = Booking.create! valid_attributes
        put :update, { id: booking.to_param, booking: valid_attributes }, valid_session
        expect(response).to redirect_to(booking)
      end
    end

    context "with invalid params" do
      it "assigns the booking as @booking" do
        booking = Booking.create! valid_attributes
        put :update, { id: booking.to_param, booking: invalid_attributes }, valid_session
        expect(assigns(:booking)).to eq(booking)
      end

      it "re-renders the 'edit' template" do
        booking = Booking.create! valid_attributes
        put :update, { id: booking.to_param, booking: invalid_attributes }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested booking" do
      booking = Booking.create! valid_attributes
      expect do
        delete :destroy, { id: booking.to_param }, valid_session
      end.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = Booking.create! valid_attributes
      delete :destroy, { id: booking.to_param }, valid_session
      expect(response).to redirect_to(bookings_url)
    end
  end
end
