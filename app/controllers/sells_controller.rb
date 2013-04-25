class SellsController < ApplicationController
  authorize_resource
  # GET /sells
  # GET /sells.json
  def index
    @categories = Category.all
    @cities = City.all
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
    @sell = Sell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sell }
    end
  end

  # GET /sells/new
  # GET /sells/new.json
  def new
    @sell = Sell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sell }
    end
  end

  # GET /sells/1/edit
  def edit
    @sell = Sell.find(params[:id])
  end

  # POST /sells
  # POST /sells.json
  def create
    @sell = Sell.new(params[:sell])
    @sell.user = current_user

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: 'Sell was successfully created.' }
        format.json { render json: @sell, status: :created, location: @sell }
      else
        format.html { render action: "new" }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sells/1
  # PUT /sells/1.json
  def update
    @sell = Sell.find(params[:id])

    respond_to do |format|
      if @sell.update_attributes(params[:sell])
        format.html { redirect_to @sell, notice: 'Sell was successfully updated.' }
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
    @sell = Sell.find(params[:id])
    @sell.destroy

    respond_to do |format|
      format.html { redirect_to sells_url }
      format.json { head :no_content }
    end
  end

  def show_category
    @category = Category.find(params[:id])
    @sells = @category.sells.paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def show_subcategory
    @category = Subcategory.find(params[:id])
    @sells = @category.sells.paginate(:page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
