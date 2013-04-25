require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SellsController do

  # This should return the minimal set of attributes required to create a valid
  # Sell. As you add validations to Sell, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "title" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SellsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sells as @sells" do
      sell = Sell.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sells).should eq([sell])
    end
  end

  describe "GET show" do
    it "assigns the requested sell as @sell" do
      sell = Sell.create! valid_attributes
      get :show, {:id => sell.to_param}, valid_session
      assigns(:sell).should eq(sell)
    end
  end

  describe "GET new" do
    it "assigns a new sell as @sell" do
      get :new, {}, valid_session
      assigns(:sell).should be_a_new(Sell)
    end
  end

  describe "GET edit" do
    it "assigns the requested sell as @sell" do
      sell = Sell.create! valid_attributes
      get :edit, {:id => sell.to_param}, valid_session
      assigns(:sell).should eq(sell)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sell" do
        expect {
          post :create, {:sell => valid_attributes}, valid_session
        }.to change(Sell, :count).by(1)
      end

      it "assigns a newly created sell as @sell" do
        post :create, {:sell => valid_attributes}, valid_session
        assigns(:sell).should be_a(Sell)
        assigns(:sell).should be_persisted
      end

      it "redirects to the created sell" do
        post :create, {:sell => valid_attributes}, valid_session
        response.should redirect_to(Sell.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sell as @sell" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sell.any_instance.stub(:save).and_return(false)
        post :create, {:sell => { "title" => "invalid value" }}, valid_session
        assigns(:sell).should be_a_new(Sell)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sell.any_instance.stub(:save).and_return(false)
        post :create, {:sell => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sell" do
        sell = Sell.create! valid_attributes
        # Assuming there are no other sells in the database, this
        # specifies that the Sell created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sell.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => sell.to_param, :sell => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested sell as @sell" do
        sell = Sell.create! valid_attributes
        put :update, {:id => sell.to_param, :sell => valid_attributes}, valid_session
        assigns(:sell).should eq(sell)
      end

      it "redirects to the sell" do
        sell = Sell.create! valid_attributes
        put :update, {:id => sell.to_param, :sell => valid_attributes}, valid_session
        response.should redirect_to(sell)
      end
    end

    describe "with invalid params" do
      it "assigns the sell as @sell" do
        sell = Sell.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sell.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell.to_param, :sell => { "title" => "invalid value" }}, valid_session
        assigns(:sell).should eq(sell)
      end

      it "re-renders the 'edit' template" do
        sell = Sell.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sell.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell.to_param, :sell => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sell" do
      sell = Sell.create! valid_attributes
      expect {
        delete :destroy, {:id => sell.to_param}, valid_session
      }.to change(Sell, :count).by(-1)
    end

    it "redirects to the sells list" do
      sell = Sell.create! valid_attributes
      delete :destroy, {:id => sell.to_param}, valid_session
      response.should redirect_to(sells_url)
    end
  end

end
