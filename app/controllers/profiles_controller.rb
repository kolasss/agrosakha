class ProfilesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:new, :index]
  # GET /profiles
  # GET /profiles.json
  def index
    # @profiles = Profile.all
    @profiles = Profile.paginate(:page => params[:page])

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @profiles }
    # end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    # @profile = Profile.find(params[:id])

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
  end

  # POST /profiles
  # POST /profiles.json
  def create
    # @profile = current_user.build_profile(params[:profile])
    # @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
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

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
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
    # authorize! :destroy, @profile
    # @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
