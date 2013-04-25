require "spec_helper"

describe CountTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/count_types").should route_to("count_types#index")
    end

    it "routes to #new" do
      get("/count_types/new").should route_to("count_types#new")
    end

    it "routes to #show" do
      get("/count_types/1").should route_to("count_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/count_types/1/edit").should route_to("count_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/count_types").should route_to("count_types#create")
    end

    it "routes to #update" do
      put("/count_types/1").should route_to("count_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/count_types/1").should route_to("count_types#destroy", :id => "1")
    end

  end
end
