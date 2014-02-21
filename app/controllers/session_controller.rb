class SessionController < ApplicationController
  def new

  end

  def create
    #initializing variables
    search_argument = params[:session][:email]
    user = nil

    #checkcing email or not
    if search_argument.scan(User::EmailRegex)[0] == nil
      user = User.find_by_login(search_argument)
    else
      user = User.find_by_email(search_argument)
    end

    #Checking for emptiness
    if !user.nil?

      #Checking password for validness
      if user.password == params[:session][:password]
        sign_in(user,params[:session][:password]) #added password because of dutyes of active record
        redirect_to root_path
      else
        render 'session/new'
      end
    else

      #if there isn't so email/login
      flash[:error] = "No user with email/login #{params[:session][:email]}"
      render 'session/new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
