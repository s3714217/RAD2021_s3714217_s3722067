class CartsController < ApplicationController
  
  # POST /users/remove_items
  def remove_items
    @cart = Cart.where(:user_id => params[:id])
    @cart.each do |cartitem| 
      cartitem.delete
    end
    redirect_to root_path
  end  
end
