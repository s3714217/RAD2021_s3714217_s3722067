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
  
  def removed_saved
    ifloggedin = true
    if(ifloggedin)        
      item = Item.find_by id: params[:itemId]
      user = User.find_by id: '1'
      user.items.delete(item)
      item.popularity =  item.popularity - 1
      item.save
    else
      array = cookies[:vistorsavedlist].split(",")
      array.delete(params[:itemId])
      cookies[:vistorsavedlist] = array.join(',')
      item = Item.find_by id: params[:itemId]
      item.popularity =  item.popularity - 1
      item.save
    end
    redirect_to '/main/savedlist'
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
          item = Item.find_by id: params[:itemId]
          item.popularity = item.popularity + 1
          item.save
          cookies[:vistorsavedlist] = cookies[:vistorsavedlist]+","+params[:itemId]
        end
      else    
        cookies[:vistorsavedlist] = params[:itemId]
      end
    end
  end
end
