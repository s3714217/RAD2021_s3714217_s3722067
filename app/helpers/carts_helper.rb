module CartsHelper
  
  def total_cost(user_id)
    @cart = Cart.where(:user_id => user_id)
    @sum = 0
    @cart.each do |cartitem| 
      @item = Item.find_by id: cartitem.item_id
      @sum += (@item.price * cartitem.quantity)
    end
    return @sum.round(2)
  end  

end
