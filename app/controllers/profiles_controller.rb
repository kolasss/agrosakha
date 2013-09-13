#encoding: utf-8
class ProfilesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:new, :index, :show_category, :show_subcategory, :update_city_select]
  
  skip_before_filter :search_sell
  before_filter :search_profile, :except => [:show_category, :show_subcategory, :update_city_select]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = @q.result(:distinct => true).paginate(:page => params[:page])
    # @profiles = Profile.paginate(:page => params[:page])

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @profiles }
    # end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @sells = @profile.user.sells.all
    @buys = @profile.user.buys.all
    @ad = (@sells + @buys).paginate(:page => params[:page], :per_page => 20)

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @profile }
    # end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    if @profile = current_user.profile
      render :action => :edit
    else
      @profile = Profile.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    end
  end

  # GET /profiles/1/edit
  def edit
    # @profile = Profile.find(params[:id])
    if @profile.city
      @cities = City.where(:region_id => @profile.city.region_id).order(:name)
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    # @profile = current_user.build_profile(params[:profile])
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Профиль создан.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    # @profile = Profile.find(params[:id])
    params[:profile][:subcategory_ids] ||= []
    params[:profile][:category_ids] ||= []
    
    params[:profile][:subcategory_ids].each do |subcat_id|
      parent_cat_id = Subcategory.find(subcat_id).category.id.to_s
      unless params[:profile][:category_ids].include?(parent_cat_id)
        params[:profile][:category_ids] << parent_cat_id
      end
    end

    params[:profile][:category_ids].collect!{|i| i.to_i}.uniq!

    # params[:profile][:city_id] = 0 if params[:profile][:region_id].nil?
    params[:profile].delete(:city_id) if params[:profile][:region_id].nil?

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Профиль обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    # @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_path }
      format.json { head :no_content }
    end
  end

  def show_category
    @regions = Region.all
    @category = Category.find(params[:id])
    @q = @category.profiles.search(params[:q])
    @profiles = @q.result(:distinct => true).paginate(:page => params[:page])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def show_subcategory
    @regions = Region.all
    @category = Subcategory.find(params[:id])
    @q = @category.profiles.search(params[:q])
    @profiles = @q.result(:distinct => true).paginate(:page => params[:page])

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

private
  def search_profile
    @regions = Region.all
    @q = Profile.search(params[:q])
  end
end
