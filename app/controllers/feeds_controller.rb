
class FeedsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Новая новость создана.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to @feed, notice: 'Новость обновлена.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
end
