class LoginController < ApplicationController
  def login
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
     redirect_to main_main_path
    end
  end
  
  def logout
    session[:current_user_id] = nil
    redirect_to main_main_path
  end
end
