class OmniauthCallbacksController < ApplicationController
    def twitter
        
        
        generated_pwd = SecureRandom.hex(10)
        if User.find_by_email(auth.info.email) == nil
            u = User.new(name: auth.info.nickname, email: auth.info.email, password: generated_pwd, password_confirmation: generated_pwd)
            u.save
            session[:current_user_id] = u.id
            session[:twitter_logged_in] = 1
            redirect_to main_main_path
        else
            session[:current_user_id] = User.find_by_email(auth.info.email).id
            session[:twitter_logged_in] = 1
            redirect_to main_main_path
        end
        
    end 
    
    def auth 
        request.env['omniauth.auth']
    end
end
