class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :search_sell, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def search_sell
  	@q = Sell.search(params[:q])
    @regions = Region.all
  end
end
