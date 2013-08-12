#encoding: utf-8
class SellsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create, :index, :show_category, :show_subcategory, :update_city_select, :update_subcat_select]
  # GET /sells
  # GET /sells.json
  def index
    # @cities = City.all
    @regions = Region.all
    @q = Sell.search(params[:q])
    @sells = @q.result(:distinct => true).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sells }
    end
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
    # @sell = Sell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sell }
    end
  end

  # GET /sells/new
  # GET /sells/new.json
  def new
    # @sell = Sell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sell }
    end
  end

  # GET /sells/1/edit
  def edit
    # @sell = Sell.find(params[:id])
    session[:return_to] ||= request.referer

    @cities = City.where(:region_id => @sell.city.region_id).order(:name) if @sell.city
    @subcats = Subcategory.where(:category_id => @sell.subcategory.category_id) if @sell.subcategory
  end

  # POST /sells
  # POST /sells.json
  def create
    if params[:sell][:type] == 'true'
      params[:sell].delete :type
      @sell = Sell.new(params[:sell])
      @sell.user = current_user

      respond_to do |format|
        if @sell.save
          format.html { redirect_to @sell, notice: 'Объявление создано.' }
          format.json { render json: @sell, status: :created, location: @sell }
        else
          format.html { render action: "new" }
          format.json { render json: @sell.errors, status: :unprocessable_entity }
        end
      end
    else
      params[:sell].delete :type
      @buy = Buy.new(params[:sell])
      @buy.user = current_user

      respond_to do |format|
        if @buy.save
          format.html { redirect_to @buy, notice: 'Объявление создано.' }
          format.json { render json: @buy, status: :created, location: @buy }
        else
          format.html { render action: "new" }
          format.json { render json: @buy.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /sells/1
  # PUT /sells/1.json
  def update
    # authorize! :update, @sell
    # @sell = Sell.find(params[:id])

    respond_to do |format|
      if @sell.update_attributes(params[:sell])
        format.html { redirect_to session.delete(:return_to) || root_path, notice: 'Объявление обновлено.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    # authorize! :destroy, @sell
    # @sell = Sell.find(params[:id])
    @sell.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def show_category
    # @cities = City.all
    @regions = Region.all

    @category = Category.find(params[:id])
    @q = @category.sells.search(params[:q])
    @sells = @q.result(:distinct => true).paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def show_subcategory
    # @cities = City.all
    @regions = Region.all

    @category = Subcategory.find(params[:id])
    @q = @category.sells.search(params[:q])
    @sells = @q.result(:distinct => true).paginate(:page => params[:page])

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
