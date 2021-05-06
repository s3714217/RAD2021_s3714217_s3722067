class MainController < ApplicationController
  def main
    @current_user="Guest"
    @items = Item.all
  end

  def about
  end

  def contact
  end
end
