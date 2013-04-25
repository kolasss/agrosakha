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

describe SubcategoriesController do

  # This should return the minimal set of attributes required to create a valid
  # Subcategory. As you add validations to Subcategory, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubcategoriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all subcategories as @subcategories" do
      subcategory = Subcategory.create! valid_attributes
      get :index, {}, valid_session
      assigns(:subcategories).should eq([subcategory])
    end
  end

  describe "GET show" do
    it "assigns the requested subcategory as @subcategory" do
      subcategory = Subcategory.create! valid_attributes
      get :show, {:id => subcategory.to_param}, valid_session
      assigns(:subcategory).should eq(subcategory)
    end
  end

  describe "GET new" do
    it "assigns a new subcategory as @subcategory" do
      get :new, {}, valid_session
      assigns(:subcategory).should be_a_new(Subcategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested subcategory as @subcategory" do
      subcategory = Subcategory.create! valid_attributes
      get :edit, {:id => subcategory.to_param}, valid_session
      assigns(:subcategory).should eq(subcategory)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Subcategory" do
        expect {
          post :create, {:subcategory => valid_attributes}, valid_session
        }.to change(Subcategory, :count).by(1)
      end

      it "assigns a newly created subcategory as @subcategory" do
        post :create, {:subcategory => valid_attributes}, valid_session
        assigns(:subcategory).should be_a(Subcategory)
        assigns(:subcategory).should be_persisted
      end

      it "redirects to the created subcategory" do
        post :create, {:subcategory => valid_attributes}, valid_session
        response.should redirect_to(Subcategory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subcategory as @subcategory" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subcategory.any_instance.stub(:save).and_return(false)
        post :create, {:subcategory => { "name" => "invalid value" }}, valid_session
        assigns(:subcategory).should be_a_new(Subcategory)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subcategory.any_instance.stub(:save).and_return(false)
        post :create, {:subcategory => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subcategory" do
        subcategory = Subcategory.create! valid_attributes
        # Assuming there are no other subcategories in the database, this
        # specifies that the Subcategory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Subcategory.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => subcategory.to_param, :subcategory => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested subcategory as @subcategory" do
        subcategory = Subcategory.create! valid_attributes
        put :update, {:id => subcategory.to_param, :subcategory => valid_attributes}, valid_session
        assigns(:subcategory).should eq(subcategory)
      end

      it "redirects to the subcategory" do
        subcategory = Subcategory.create! valid_attributes
        put :update, {:id => subcategory.to_param, :subcategory => valid_attributes}, valid_session
        response.should redirect_to(subcategory)
      end
    end

    describe "with invalid params" do
      it "assigns the subcategory as @subcategory" do
        subcategory = Subcategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subcategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => subcategory.to_param, :subcategory => { "name" => "invalid value" }}, valid_session
        assigns(:subcategory).should eq(subcategory)
      end

      it "re-renders the 'edit' template" do
        subcategory = Subcategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subcategory.any_instance.stub(:save).and_return(false)
        put :update, {:id => subcategory.to_param, :subcategory => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subcategory" do
      subcategory = Subcategory.create! valid_attributes
      expect {
        delete :destroy, {:id => subcategory.to_param}, valid_session
      }.to change(Subcategory, :count).by(-1)
    end

    it "redirects to the subcategories list" do
      subcategory = Subcategory.create! valid_attributes
      delete :destroy, {:id => subcategory.to_param}, valid_session
      response.should redirect_to(subcategories_url)
    end
  end

end