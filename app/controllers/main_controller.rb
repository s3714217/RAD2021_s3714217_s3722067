class MainController < ApplicationController
  def main
    @current_user= User.first
    @items = Item.all
    @selected_item = params[:selected_item]
    if @selected_item != nil
      ActiveRecord::Base.connection.execute("INSERT INTO 'items_users' (item_id, user_id) VALUES (#{params[:selected_item]},#{@current_user.id})")
      puts "ADDED #{params[:selected_item]} to #{@current_user.id}"
      @selected_item = nil
    end
  end

  def about
  end

  def contact
  end
end
