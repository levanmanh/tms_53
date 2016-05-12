class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.edit_user_message"
      redirect_to edit_admin_user_path
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "create.message_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "destroy_success"
      redirect_to admin_users_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  # def ajax_respond
  #   @action = params[:action]
  #   respond_to do |format|
  #     format.html {redirect_to admin_users_path(from: @action, id: @user.id)}
  #     format.js
  #   end
  # end

  def find_user
    @user = User.find params[:id] 
  end
end
