class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :one_popular
  # before_filter :search_sell, if: :devise_controller?
  before_filter :search_sell, :except => [:show_category, :show_subcategory, :update_city_select, :update_subcat_select]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def search_sell
  	@q = Sell.search(params[:q])
    @regions = Region.all
  end

  def one_popular
  	@ga = GaPageviewsRecord.limit(10).shuffle.first
    if @ga
    	if @ga.model_type == "sells"
    		@popular = Sell.find_by_id(@ga.model_id)
  	  else
    		@popular = Buy.find_by_id(@ga.model_id)
    	end
    end
		@popular = Sell.first if !@popular
  end
end
