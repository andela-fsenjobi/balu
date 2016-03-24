require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it "assigns all flights as @flights" do
      flight = Flight.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:flights)).to eq([flight])
    end
  end

  describe 'GET #show' do
    it "assigns the requested flight as @flight" do
      flight = Flight.create! valid_attributes
      get :show, { id: flight.to_param }, valid_session
      expect(assigns(:flight)).to eq(flight)
    end
  end

  describe 'GET #new' do
    it "assigns a new flight as @flight" do
      get :new, {}, valid_session
      expect(assigns(:flight)).to be_a_new(Flight)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested flight as @flight" do
      flight = Flight.create! valid_attributes
      get :edit, { id: flight.to_param }, valid_session
      expect(assigns(:flight)).to eq(flight)
    end
  end

  describe 'POST #create' do
    context "with valid params" do
      it "creates a new Flight" do
        expect do
          post :create, { flight: valid_attributes }, valid_session
        end.to change(Flight, :count).by(1)
      end

      it "assigns a newly created flight as @flight" do
        post :create, { flight: valid_attributes }, valid_session
        expect(assigns(:flight)).to be_a(Flight)
        expect(assigns(:flight)).to be_persisted
      end

      it "redirects to the created flight" do
        post :create, { flight: valid_attributes }, valid_session
        expect(response).to redirect_to(Flight.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved flight as @flight" do
        post :create, { flight: invalid_attributes }, valid_session
        expect(assigns(:flight)).to be_a_new(Flight)
      end

      it "re-renders the 'new' template" do
        post :create, { flight: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    context "with valid params" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested flight" do
        flight = Flight.create! valid_attributes
        put :update, { id: flight.to_param, flight: new_attributes }, valid_session
        flight.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested flight as @flight" do
        flight = Flight.create! valid_attributes
        put :update, { id: flight.to_param, flight: valid_attributes }, valid_session
        expect(assigns(:flight)).to eq(flight)
      end

      it "redirects to the flight" do
        flight = Flight.create! valid_attributes
        put :update, { id: flight.to_param, flight: valid_attributes }, valid_session
        expect(response).to redirect_to(flight)
      end
    end

    context "with invalid params" do
      it "assigns the flight as @flight" do
        flight = Flight.create! valid_attributes
        put :update, { id: flight.to_param, flight: invalid_attributes }, valid_session
        expect(assigns(:flight)).to eq(flight)
      end

      it "re-renders the 'edit' template" do
        flight = Flight.create! valid_attributes
        put :update, { id: flight.to_param, flight: invalid_attributes }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested flight" do
      flight = Flight.create! valid_attributes
      expect do
        delete :destroy, { id: flight.to_param }, valid_session
      end.to change(Flight, :count).by(-1)
    end

    it "redirects to the flights list" do
      flight = Flight.create! valid_attributes
      delete :destroy, { id: flight.to_param }, valid_session
      expect(response).to redirect_to(flights_url)
    end
  end
end
