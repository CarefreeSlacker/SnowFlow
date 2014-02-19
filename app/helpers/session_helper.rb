module SessionHelper


  def sign_in(user,password)
    token = User.new_token #creating new token for session
    cookies.permanent[:token] = token #saving token in cookies
    user.remember_token =  User.encrypt(token) #writing encrypted session token in database
    user.save
    current_user = user #seting current user
    new_cart =  Cart.create(user_id: user.id) #setting its cart
    current_user.carts << new_cart
    current_cart = new_cart #setting current cart
  end

  def sign_out
    current_user = nil
    current_cart = nil
    cookies.delete(:token)
  end

  def current_user
    @current_user ||= User.find_by_remember_token(User.encrypt(cookies[:token])) #finding user by remember token
  end

  def current_user=(value)
    @current_user = value
  end

  def current_cart
    if current_user.nil?
      @current_cart = Cart.new #using is noone signed
    else
      @current_cart ||= current_user.carts.last
    end
  end

  def current_cart=(value)
    @current_cart = value
  end

  def signed? #no comment
    !current_user.nil?
  end

end
