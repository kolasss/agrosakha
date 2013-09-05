class CountTypesController < ApplicationController
  load_and_authorize_resource
  before_filter :search_sell
  # GET /count_types
  # GET /count_types.json
  def index
    # @count_types = CountType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @count_types }
    end
  end

  # GET /count_types/1
  # GET /count_types/1.json
  def show
    # @count_type = CountType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @count_type }
    end
  end

  # GET /count_types/new
  # GET /count_types/new.json
  def new
    # @count_type = CountType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @count_type }
    end
  end

  # GET /count_types/1/edit
  def edit
    # @count_type = CountType.find(params[:id])
  end

  # POST /count_types
  # POST /count_types.json
  def create
    # @count_type = CountType.new(params[:count_type])

    respond_to do |format|
      if @count_type.save
        format.html { redirect_to count_types_path, notice: 'Count type was successfully created.' }
        format.json { render json: @count_type, status: :created, location: @count_type }
      else
        format.html { render action: "new" }
        format.json { render json: @count_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /count_types/1
  # PUT /count_types/1.json
  def update
    # @count_type = CountType.find(params[:id])

    respond_to do |format|
      if @count_type.update_attributes(params[:count_type])
        format.html { redirect_to count_types_path, notice: 'Count type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @count_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /count_types/1
  # DELETE /count_types/1.json
  def destroy
    # @count_type = CountType.find(params[:id])
    @count_type.destroy

    respond_to do |format|
      format.html { redirect_to count_types_path }
      format.json { head :no_content }
    end
  end
end
