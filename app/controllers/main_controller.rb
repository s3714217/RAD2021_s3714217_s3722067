class MainController < ApplicationController
  def main
    @test = "active"
     @current_user = User.find_by_id(session[:current_user_id])
      if @current_user == nil
        @current_user = User.new(name: "Guest", email: "guest@test.com", password: "123456789", password_confirmation: "123456789")
      end
    
    @items = Item.all
    @selected_item = params[:selected_item]
    if @selected_item != nil
      @current_user.items << Item.find_by(id:@selected_item)
      @selected_item = nil
    end
    
  end

  def about
   
  end

  def contact
    
  end
end
