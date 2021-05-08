class MainController < ApplicationController
  def main
  end

  def about
  end

  def contact
  end
  
  def to_productdetails
    redirect_to '/main/productdetails', notice: params[:itemId]
  end
end
