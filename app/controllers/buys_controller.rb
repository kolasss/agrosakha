class BuysController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:index, :show_category, :show_subcategory, :update_city_select, :update_subcat_select]
  # GET /buys
  # GET /buys.json
  def index
    # @cities = City.all
    @regions = Region.all
    @q = Buy.search(params[:q])
    @buys = @q.result(:distinct => true).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buys }
    end
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
    # @buy = Buy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buy }
    end
  end

  # GET /buys/new
  # GET /buys/new.json
  def new
    # @buy = Buy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buy }
    end
  end

  # GET /buys/1/edit
  def edit
    # @buy = Buy.find(params[:id])
    session[:return_to] ||= request.referer

    @cities = City.where(:region_id => @buy.city.region_id).order(:name) if @buy.city
    @subcats = Subcategory.where(:category_id => @buy.subcategory.category_id) if @buy.subcategory
  end

  # POST /buys
  # POST /buys.json
  def create
    # @buy = Buy.new(params[:buy])
    @buy.user = current_user

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'Buy was successfully created.' }
        format.json { render json: @buy, status: :created, location: @buy }
      else
        format.html { render action: "new" }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buys/1
  # PUT /buys/1.json
  def update
    # authorize! :update, @buy
    # @buy = Buy.find(params[:id])

    respond_to do |format|
      if @buy.update_attributes(params[:buy])
        format.html { redirect_to session.delete(:return_to) || root_path, notice: 'Buy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    # authorize! :destroy, @buy
    # @buy = Buy.find(params[:id])
    @buy.destroy

    respond_to do |format|
      format.html { redirect_to buys_url }
      format.json { head :no_content }
    end
  end

  def show_category
    @category = Category.find(params[:id])
    @buys = @category.buys.paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def show_subcategory
    @category = Subcategory.find(params[:id])
    @buys = @category.buys.paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def update_city_select
    if params[:id] == 'no' || params[:id].blank?
      @cities = []
    else
      @cities = City.where(:region_id => params[:id]).order(:name)
    end
    render :partial => "cities", :locals => {:cities => @cities}
  end

  def update_subcat_select
    if params[:id] == 'no' || params[:id].blank?
      @subcats = []
    else
      @subcats = Subcategory.where(:category_id => params[:id])
    end
    render :partial => "subcats", :locals => {:subcats => @subcats}
  end
end
