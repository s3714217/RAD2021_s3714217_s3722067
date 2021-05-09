class CartsController < ApplicationController
  include CartsHelper
  # POST /id/remove_items
  def remove_items
    @cart = Cart.where(:user_id => params[:id])
    @cart.each do |cartitem| 
      cartitem.delete
    end
    user = User.find_by id: params[:id]
    if(user.has_rating?)
      redirect_to root_path
    else
      redirect_to main_rating_path, notice: params[:id]
    end
  end  
  
  # POST /add_to
  def add_to
    Cart.new
    @cart = Cart.new(cart_params)
    item = Item.find_by id: cart_params["item_id"]
    item.popularity = item.popularity + 1
    item.save
    @cart.save
  end  
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.permit(:id, :item_id, :size, :colour, :quantity, :user_id)
  end
  
end
