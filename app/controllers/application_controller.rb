class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def search_sell
  	@q = Sell.search(params[:q])
    @regions = Region.all
  end
end
