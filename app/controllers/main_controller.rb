class MainController < ApplicationController
  def main
    @test = "active"
    @current_user = User.find_by_id(session[:current_user_id])

    @items = Item.all
    @selected_item = params[:selected_item]
    if @selected_item != nil
      #Adding Item to cookies if guest
      to_saved_param(@selected_item)
      @selected_item = nil
    end
    
  end

  def about
   
  end

  def contact
    
  end
  
  def to_productdetails
    redirect_to '/main/productdetails', notice: params[:itemId]
  end
  
  def filter_saved
    filteredItems = Item.all
    if(params[:category] != 'All')
      filteredItems = filteredItems.select {|item| filter_category(item, params[:category])}
    end
    
    tags =["Shirt", "Dress", "Sporting", "Hoodie", "Sweater"]
    tagsWithParams = { "Shirt" => :Shirt, "Dress" => :Dress, "Sporting" => :Sporting, "Hoodie" => :Hoodie, "Sweater" => :Sweater }
    if(params[:AllTags])
      filteredItems = filteredItems.select{|item| filter_tag(item,tags)}
    else
      tagsFromForm = []
      tagsWithParams.each do |tag, param|
        if(params[param]) 
          tagsFromForm << tag
        end
      end
      filteredItems = filteredItems.select {|item| filter_tag(item,tagsFromForm)}
    end
    
    coloursWithParams = { "RED" => :RED, "BLUE" => :BLUE, "GREEN" => :GREEN, "BLACK" => :BLACK}
    coloursFromForm = []
      coloursWithParams.each do |colour, param|
        if(params[param]) 
          coloursFromForm << colour
        end
      end
    filteredItems.select! {|item| filter_colour(item, coloursFromForm)}
            
    filteredItems.select! {|item| filter_size(item, params[:size])}
    
    idArray = []
    filteredItems.each do |item|
      idArray << item.id
    end
    redirect_to '/main/testcollection', notice: idArray
  end
  
  
  def filter_category(item, category)
    item.category.split(",").include? category
  end
  
  
  def filter_tag(item, tag)
    !(item.tag.split(",") & tag).empty?
  end
  
  
  def filter_colour(item, colour)
    !(item.colour.split(",") & colour).empty?
  end
  
  
  def filter_size(item, size)
    item.size.split(",").include? size
  end
  
  def removed_saved
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
    if(ifloggedin)        
      item = Item.find_by id: params[:itemId]
      user = User.find_by id: session[:current_user_id]
      user.items.delete(item)
      item.popularity =  item.popularity - 1
      item.save
    else
      array = cookies[:vistorsavedlist].split(",")
      array.delete(params[:itemId])
      if(array.empty?)
        cookies.delete :vistorsavedlist
      else
        cookies[:vistorsavedlist] = array.join(',')
      end
      item = Item.find_by id: params[:itemId]
      item.popularity =  item.popularity - 1
      item.save
    end
    redirect_to '/main/savedlist'
  end
  
  def to_saved
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
    if(ifloggedin)
      item = Item.find_by id: params[:itemId]
      user = User.find_by id: session[:current_user_id]
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
  
    
  def to_saved_param(itemId)
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
    if(ifloggedin)
      item = Item.find_by id: itemId
      user = User.find_by id: session[:current_user_id]
      if (!user.items.include?(item))
        user.items << item
        item.popularity =  item.popularity + 1
        item.save
      end
    else
      if(cookies[:vistorsavedlist])
        array = cookies[:vistorsavedlist].split(",")
        if(!array.include?itemId)
          item = Item.find_by id: itemId
          item.popularity = item.popularity + 1
          item.save
          cookies[:vistorsavedlist] = cookies[:vistorsavedlist]+","+itemId
        end
      else    
        cookies[:vistorsavedlist] = itemId
      end
    end
  end
  
  
  def cart_redirect
    if(!session[:current_user_id])
      redirect_to login_login_path
    end
  end
  helper_method :cart_redirect
  
end
