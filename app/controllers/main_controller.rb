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
  
  def to_saved
    ifloggedin = true
    if(ifloggedin)
      item = Item.find_by id: params[:itemId]
      user = User.find_by id: '1'
      if (!user.items.include?(item))
        user.items << item
        item.popularity =  item.popularity + 1
        item.save
      end
    else
      if(cookies[:vistorsavedlist])
        array = cookies[:vistorsavedlist].split(",")
        if(!array.include?params[:itemId])
          item.popularity = item.popularity + 1
          cookies[:vistorsavedlist] = cookies[:vistorsavedlist]+","+params[:itemId]
        end
      else    
        cookies[:vistorsavedlist] = params[:itemId]
      end
    end
  end
end
