require "spec_helper"

describe GaPageviewsRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/ga_pageviews_records").should route_to("ga_pageviews_records#index")
    end

    it "routes to #new" do
      get("/ga_pageviews_records/new").should route_to("ga_pageviews_records#new")
    end

    it "routes to #show" do
      get("/ga_pageviews_records/1").should route_to("ga_pageviews_records#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ga_pageviews_records/1/edit").should route_to("ga_pageviews_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ga_pageviews_records").should route_to("ga_pageviews_records#create")
    end

    it "routes to #update" do
      put("/ga_pageviews_records/1").should route_to("ga_pageviews_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ga_pageviews_records/1").should route_to("ga_pageviews_records#destroy", :id => "1")
    end

  end
end
