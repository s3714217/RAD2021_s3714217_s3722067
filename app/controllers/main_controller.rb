class MainController < ApplicationController
  def main
    @active_item = "active"
    @current_user = User.find_by_id(session[:current_user_id])
    @items = Item.order('popularity DESC')
    
    @savedlist = []
    if session[:current_user_id] == nil 
      if cookies[:vistorsavedlist] != nil
       visitor_list = cookies[:vistorsavedlist].split(",")
       visitor_list.each do |i|
             @savedlist.append(Item.find_by_id(i))
       
       end
     end
    else
             @savedlist = @current_user.items
    end
    
    @selected_item = params[:selected_item]
    if @selected_item != nil
      to_saved_param(@selected_item)
      @selected_item = nil
      redirect_to '/main/main'
    end
  end
  
  def to_productdetails
    redirect_to '/main/productdetails', notice: params[:itemId]
  end

  def toggle_saved
    if is_in_saved_list(params[:itemId])
      removed_saved_param(params[:itemId])
    else
      to_saved_param(params[:itemId])
    end
  end
  
  def is_in_saved_list(itemId)
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
    
    if(ifloggedin)  
      item = Item.find_by id: itemId
      user = User.find_by id: session[:current_user_id]
      user.items.include?(item)
    else
      if cookies[:vistorsavedlist]
        array = cookies[:vistorsavedlist].split(",")
        array.include?(itemId.to_s)
      end
    end
  end
  helper_method :is_in_saved_list
  
  def removed_saved
    removed_saved_param(params[:itemId])
  end
  
  def removed_saved_param(itemId)
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
    if(ifloggedin)        
      item = Item.find_by id: itemId
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
      item = Item.find_by id: itemId
      item.popularity =  item.popularity - 1
      item.save
    end
    if request.referrer
     redirect_to request.referrer
    end
  end
  
  def to_saved
    to_saved_param_with_user(params[:itemId], session[:current_user_id])
  end
    
  def to_saved_param(itemId)
    to_saved_param_with_user(itemId, session[:current_user_id])
  end
  
  def to_saved_param_with_user(itemId, userId)
    ifloggedin = false
    if(userId)
      ifloggedin = true
    end
    if(ifloggedin)
      item = Item.find_by id: itemId
      user = User.find_by id: userId
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
    if request
      if request.referrer
        redirect_to request.referrer
      end
    end
  end
  
  def cart_redirect()
    if(!session[:current_user_id])
      redirect_to login_login_path
    end
  end
  helper_method :cart_redirect
  
  def all_collection
    
   setup_category()
   process_selected_category(params[:selected_cate])
   if params[:search_text] != nil
      @displaying_items = search(params[:search_text])
      return
    end
    
    @displaying_items = filter_by_tag(@all_tags,@displaying_items)
    @displaying_items = filter_by_size(@all_size, @displaying_items)
    @displaying_items = filter_by_colour(@all_colour, @displaying_items)
    
  end
  
  def getSizeOptionArray(item)
    sizeOptionArray = Array.new(item.size.split(",").size) { Array.new(2) }
    item.size.split(",").each_with_index do |size, index|
      sizeOptionArray[index] = [size,size]
    end
  end
  helper_method :getSizeOptionArray
    
  def getColourOptionArray(item)
    colourOptionArray = Array.new(item.colour.split(",").size) { Array.new(2) }
    item.colour.split(",").each_with_index do |colour, index|
      colourOptionArray[index] = [colour,colour]
    end
  end
  helper_method :getColourOptionArray
  
  def is_logged_in
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
  end
  helper_method :is_logged_in
  
  def to_main
    redirect_to main_main_path
  end
  helper_method  :to_main
    
  
  
  def setup_category()
    @items = Item.all
    @displaying_items = [] 
    
    
    @all_tags = []
       @items.each do |item|
        str = item.tag.split(",")
           str.each do |s| 
               if !@all_tags.include?(s)
                   @all_tags.append(s)
              end
            end
        end
    
    @all_size = []
       @items.each do |item|
        str = item.size.split(",")
           str.each do |s| 
               if !@all_size.include?(s)
                   @all_size.append(s)
              end
            end
        end
        
    @all_colour= []
       @items.each do |item|
        str = item.colour.split(",")
           str.each do |s| 
               if !@all_colour.include?(s)
                   @all_colour.append(s)
              end
            end
        end
  end
  
  def search(content)
    return Item.where("name LIKE ?", "%#{content}%")
  end
  
  def process_selected_category(selected_category)
    @all_tag = 'btn btn-light'
    @men_tag = 'btn btn-light'
    @women_tag = 'btn btn-light'
    @kid_tag = 'btn btn-light'
    @new_tag = 'btn btn-light'
    
    
    if selected_category != nil
      @items.each do |item|
        str = item.category.split(",")
         if str.include?(selected_category)
           @displaying_items.append(item)
         end
      end
    end
    
    case selected_category
    when "Men"
      @men_tag = 'btn btn-light active'
    when "Women"
      @women_tag = 'btn btn-light active'
    when "Kids"
      @kid_tag = 'btn btn-light active'
    when "New"
      @new_tag = 'btn btn-light active'
    else
      @all_tag = 'btn btn-light active'
      @displaying_items = @items
    end
  end
  
  def filter_by_size(collection, display_items)
    
    temp = display_items
    display_items = []
    filtered = false
    
    collection.each do |t|
      if params[t] != nil
       temp.each do |i|
         puts(i.size, i.size.include?(params[t]))
         if i.size.include?(params[t])
           if !display_items.include?(i) 
             display_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    if !filtered
      display_items = temp
    end
    return display_items
  end
  
  def filter_by_tag(collection, display_items)
    
    temp = display_items
    display_items = []
    filtered = false
    
    collection.each do |t|
      if params[t] != nil
       temp.each do |i|
         puts(i.tag, i.tag.include?(params[t]))
         if i.tag.include?(params[t])
           if !display_items.include?(i) 
             display_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    if !filtered
      display_items = temp
    end
    return display_items
  end
  
  def filter_by_colour(collection, display_items)
    
    temp = display_items
    display_items = []
    filtered = false
    
    collection.each do |t|
      if params[t] != nil
       temp.each do |i|
         if i.colour.include?(params[t])
           if !display_items.include?(i) 
             display_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    if !filtered
      display_items = temp
    end
    return display_items
  end
  
  def is_logged_in
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
  end
  helper_method :is_logged_in
    
end
