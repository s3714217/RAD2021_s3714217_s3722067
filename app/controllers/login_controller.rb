class LoginController < ApplicationController
  
  def twitter_auth
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:current_user_id] = @user.id
    redirect_to root_path
  end
  
  def auth_hash
    request.env['omniauth.auth']
  end
  
  def login
    
    token = request.url.split(".").last
    if token.include?("token:")
      token_sign_in(token)
    end
    
  
    @notification = ""
    if params[:username] != nil
        @current_user = User.find_by(name:params[:username]).try(:authenticate, params[:password])
  
        if @current_user == false || @current_user == nil
          @notification = "Incorrect username or password"
          return
        end
        session[:current_user_id] = @current_user.id
        
        if params[:itemId] && !params[:itemId].empty?
          cart_params = JSON.parse params[:itemId].gsub('=>', ':')
          cart_params[:user_id] = session[:current_user_id]
          @CartsController = CartsController.new
          @CartsController.add_to_with_param(cart_params)
        end
       
        if cookies[:vistorsavedlist]
          @arrayOfItems = cookies[:vistorsavedlist].split(",")
          @arrayOfItems.each do |itemId|
            @MainController = MainController.new
            @MainController.to_saved_param_with_user(itemId,session[:current_user_id])
          end
          # Uncomment if local saved if should be deleted after login
          # cookies.delete :vistorsavedlist
        end
        session[:twitter_logged_in] = 0
        redirect_to main_main_path
    end
  end

  def sign_up
    @all_user = User.all
    @notification = ""
    
    if  params[:email] != nil
      @all_user.each do |user|
        
        if params[:password] != params[:repassword]
          @notification =  "Confirm password does not match"
          return
        end
        
        if user.email == params[:email]
          @notification =  "Email already exist"
          return
        end 
        
        if user.name == params[:username]
          @notification = "Username already taken"
          return
        end
      end
     u = User.new(name: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:repassword])
     u.save
     session[:current_user_id] = u.id
     session[:twitter_logged_in] = 0
     redirect_to main_main_path
    end
  end
  
  #Update user's details 
  def update_details
    @all_user = User.all
    @user = User.find_by id: session[:current_user_id]
    @notification = ""
    
    if !@user.authenticate(params[:oldpassword])
      if params[:oldpassword]
        @notification =  "Wrong Password"
      else
        @notification = ""
      end
      return
    end 
        
    if params[:password] != params[:repassword]
      @notification =  "Confirm password does not match"
      return
    end 
    
    
    if  params[:email] != nil
      @all_user.each do |user|

        if user.email == params[:email] && user.email != @user.email
          @notification =  "Email already exist"
          return
        end 
        
      end
     User.update(session[:current_user_id], email: params[:email], password: params[:password], password_confirmation: params[:repassword])
     redirect_to main_main_path
    end
  end
  
  def logout
    session[:current_user_id] = nil
    session[:twitter_logged_in] = 0
    redirect_to main_main_path
  end
  
  def forgot_pwd
    if params[:email] != nil
      
      @user = User.where("email LIKE ?", "#{params[:email]}")
      if @user.first != nil
        @notification = "A recover url has been sent to your email"
        token = generate_access_token()
        token_url = "https://#{request.env['HTTP_HOST']}" + login_login_path+ ".token:" + token
        send_access_token(token_url, @user.first.email, token)
        
      else
        @notification = "Email has not been registered"
      end
      
    end
  end
  
  def generate_access_token()
     return random_number = SecureRandom.hex(20)
  end 
  
  def send_access_token(token_url, email, token)
    puts token_url
    user = User.find_by_email(email)
    t = AccessToken.new(email: email,user_id: user.id ,token: token )
    t.save
    UserNewsletterMailer.send_recover_email(token_url, email).deliver_now
  end
end
  
  def token_sign_in(token)
    token = token.split("token:").last
      if AccessToken.find_by_token(token) != nil
        session[:current_user_id] = AccessToken.find_by_token(token).user_id
        AccessToken.find_by_token(token).destroy
        puts AccessToken.all.length
        redirect_to main_main_path
      else
        @notification = "Your access URL has expired"
      end
  end
end
