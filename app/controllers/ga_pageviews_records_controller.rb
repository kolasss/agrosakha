#encoding: utf-8
class GaPageviewsRecordsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:index]
  # before_filter :search_sell
  # GET /ga_pageviews_records
  # GET /ga_pageviews_records.json
  def index
    # @ga_pageviews_records = GaPageviewsRecord.all
    @ga_pageviews_records = GaPageviewsRecord.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ga_pageviews_records }
    end
  end

  # GET /ga_pageviews_records/1
  # GET /ga_pageviews_records/1.json
  def show
    # @ga_pageviews_record = GaPageviewsRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ga_pageviews_record }
    end
  end

  # GET /ga_pageviews_records/new
  # GET /ga_pageviews_records/new.json
  def new
    # @ga_pageviews_record = GaPageviewsRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ga_pageviews_record }
    end
  end

  # GET /ga_pageviews_records/1/edit
  def edit
    # @ga_pageviews_record = GaPageviewsRecord.find(params[:id])
  end

  # POST /ga_pageviews_records
  # POST /ga_pageviews_records.json
  def create
    # @ga_pageviews_record = GaPageviewsRecord.new(params[:ga_pageviews_record])

    respond_to do |format|
      if @ga_pageviews_record.save
        format.html { redirect_to @ga_pageviews_record, notice: 'Запись статистики создана.' }
        format.json { render json: @ga_pageviews_record, status: :created, location: @ga_pageviews_record }
      else
        format.html { render action: "new" }
        format.json { render json: @ga_pageviews_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ga_pageviews_records/1
  # PUT /ga_pageviews_records/1.json
  def update
    # @ga_pageviews_record = GaPageviewsRecord.find(params[:id])

    respond_to do |format|
      if @ga_pageviews_record.update_attributes(params[:ga_pageviews_record])
        format.html { redirect_to @ga_pageviews_record, notice: 'Запись статистики обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ga_pageviews_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ga_pageviews_records/1
  # DELETE /ga_pageviews_records/1.json
  def destroy
    # @ga_pageviews_record = GaPageviewsRecord.find(params[:id])
    @ga_pageviews_record.destroy

    respond_to do |format|
      format.html { redirect_to ga_pageviews_records_url }
      format.json { head :no_content }
    end
  end
end
