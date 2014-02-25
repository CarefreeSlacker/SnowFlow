class AdminController < ApplicationController
  #before filters
  before_action :admin_filter
  before_action :set_user, only: [:show, :edit,:update,:destroy]
  before_action :access_allowed, only: [:edit, :update, :destroy]

  #actions
  def new
    @user = User.new
  end

  def create
    @user = User.new( admin_params )
    @user.role = 'admin'
    if @user.save && admin_params[:password]
      sign_in(@user, admin_params[:password])
      flash.now[:success] = "Admin #{admin_params[:login]} has successfully created"
      redirect_to admin_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render 'admin/new'
    end

  end


  def edit
  end

  def update
    if @user.update(admin_params)
      flash[:success] = 'Changes have done'
      redirect_to admin_path
    else
      flash.now[:error] = @user.errors.full_messages
      render 'admin/edit'
    end
  end

  def destroy
    @user.delete
    flash.now[:success] = 'Admin was successfully deleted'
    redirect_to root_path
  end

  def index
    params[:page] ||= 1
    @users = User.where(role: 'admin').paginate(page: params[:page])
  end


  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def access_allowed
      if signed?
        render 'shared/error_303' unless current_user.id ==  params[:id].to_i
      else
        render 'shared/error_303'
      end
    end


    def admin_params
      params.require(:user).permit(:name,:login,:email,:password, :role)
    end

end
