class CartsController < ApplicationController
  include CartsHelper
  
  def remove_items
    @cart = Cart.where(:user_id => params[:userId])
    @cart.each do |cartitem| 
      purchase = Purchase.new(item_id: cartitem.item_id, user_id: cartitem.user_id, size: cartitem.size, colour: cartitem.colour, quantity: cartitem.quantity)
      purchase.save
      cartitem.delete
    end
    user = User.find_by id: params[:userId]
    if(user.has_rating?)
      redirect_to root_path
    else
      redirect_to main_rating_path, notice: params[:userId]
    end
  end  
  
  def remove_item
    cartItem = Cart.find_by id: params[:cartitemId]
    cartItem.destroy
    item = Item.find_by id: params[:itemId]
    item.popularity =  item.popularity - 1
    item.save
    redirect_to main_checkout_path
  end  
  
  def add_to
    if(!session[:current_user_id])
      redirect_to login_login_path, notice: cart_params
    else
      add_to_with_param(cart_params)
    end
  end
  
  def add_to_with_param(cart_params)
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
