class HomeController < ApplicationController
  # authorize_resource

  def index
    @regions = Region.all

    @q = Sell.search(params[:q])
    @sells = @q.result(:distinct => true)
    # @sells = Sell.paginate(:page => params[:page])
    @q2 = Buy.search(params[:q])
    @buys = @q2.result(:distinct => true)
    # @buys = Buy.paginate(:page => params[:page])
    @ad = (@sells + @buys).sort_by {|obj| obj.updated_at}.reverse!.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
end
