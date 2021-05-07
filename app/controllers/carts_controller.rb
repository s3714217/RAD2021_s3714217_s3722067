class CartsController < ApplicationController
  
  # POST /users/remove_items
  def remove_items
    @cart = Cart.where(:user_id => params[:id])
    @cart.each do |cartitem| 
      cartitem.delete
    end
    redirect_to root_path
  end  
  
  # POST /users/add_to
  def add_to
    Cart.new
    @cart = Cart.new(cart_params)
    debugger
    @cart.save
  end  
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.permit(:id, :item_id, :size, :colour, :quantity, :user_id)
  end
  
end
