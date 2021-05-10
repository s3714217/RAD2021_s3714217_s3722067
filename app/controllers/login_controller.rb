class LoginController < ApplicationController
  def login
  end

  def sign_up
    @all_user = User.all
    @notification = ""
    
    @all_user.each do |user|
       
        puts user.name 
      end
    
    if  params[:email] != nil
      @all_user.each do |user|
        if user.email == params[:email]
          @notification =  "Email already exist"
          return
        end 
        
         if user.nam == params[:username]
          @notification = "Username already taken"
          return
         end
      end
     u = User.new(name: params[:username], email: params[:email], password: params[:password])
     u.save
      
     
    end
    
    
  end
end
