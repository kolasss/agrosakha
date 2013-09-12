#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => :index

  # before_filter :search_sell

  def index
    # authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.paginate(:page => params[:page])
  end

  def show
    # @user = User.find(params[:id])
  end

  def update
    # authorize! :update, @user, :message => 'Not authorized as an administrator.'
    # @user = User.find(params[:id])

    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if current_user.has_role? :admin
      if @user.update_attributes(params[:user], :as => :admin)
        redirect_to users_path, :notice => "Пользователь обновлен."
      else
        redirect_to users_path, :alert => "Не удалось обновить пользователя."
      end
    else
      if @user.update_attributes(params[:user])
        redirect_to users_path, :notice => "Пользователь обновлен."
      else
        redirect_to users_path, :alert => "Не удалось обновить пользователя."
      end
    end
    
  end

  def destroy
    # authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    # @user = User.find(params[:id])
    unless @user == current_user
      @user.destroy
      redirect_to users_path, :notice => "Пользователь удален."
    else
      redirect_to users_path, :notice => "Нельзя удалять свой аккаунт."
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

end