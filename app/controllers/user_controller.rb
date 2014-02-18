class UserController < ApplicationController
  #filters
  before_filter :access_allowed, only: [:edit,:update,:new_post]
  before_filter :admin_filter, only: [:destroy]
  before_filter :signed_filter, only: [:show,:index,:edit,:update,:destroy]
  before_filter :set_user, only: [:edit, :update, :destroy, :show, :new_post, :following, :followers]


  #actions
  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      sign_in(@user, user_params[:password])
      flash.now[:success] = "User #{user_params[:login]} has successfully created"
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render 'user/new'
    end

  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Changes have done'
      redirect_to user_path
    else
      render 'user/edit'
    end
  end

  def destroy
    @user.delete
    flash.now[:success] = 'User was successfully deleted'
    redirect_to root_path
  end

  def index
    params[:page] ||= 1
    @users = User.paginate(page: params[:page])
  end

  def show
  end



  private

    WillPaginate.per_page = 10

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

    def signed_filter
      render 'shared/invite' unless current_user
    end


    def user_params
      params.require(:user).permit(:name,:login,:email,:password, :password_confirmation)
    end

    def admin_filter
      render 'shared/error_303' unless current_user.admin?
    end
end
