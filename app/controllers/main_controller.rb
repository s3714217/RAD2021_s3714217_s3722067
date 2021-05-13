class MainController < ApplicationController
  def main
    
    
    @active_item = "active"
    @current_user = User.find_by_id(session[:current_user_id])
    @items = Item.all
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
    redirect_to  main_collection_path, notice: idArray
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
  
  def searched
    seacherItems = Item.where("name LIKE ?", "%#{params[:search]}%")
    idArray = []
    seacherItems.each do |item|
      idArray << item.id
    end
    redirect_to  main_collection_path, notice: idArray
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
    redirect_to request.referrer
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
      redirect_to request.referrer
    end
  end
  
  def cart_redirect()
    if(!session[:current_user_id])
      redirect_to login_login_path
    end
  end
  helper_method :cart_redirect
  
  def all_collection
    
    @items = Item.all
    @displaying_items = [] 
    
    if params[:search_text] != nil
      seacherItems = Item.where("name LIKE ?", "%#{params[:search_text]}%")
      
    end
    
    @selected_item = params[:selected_item]
    if @selected_item != nil
      to_saved_param(@selected_item)
      @selected_item = nil
    end
    
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
   
    
    @all_tag = 'btn btn-light'
    @men_tag = 'btn btn-light'
    @women_tag = 'btn btn-light'
    @kid_tag = 'btn btn-light'
    @new_tag = 'btn btn-light'
    
    
    if params[:selected_cate] != nil
      @items.each do |item|
        
        str = item.category.split(",")
        
         if str.include?(params[:selected_cate])
           @displaying_items.append(item)
         end
      end
    end
    case params[:selected_cate]
    
    when "All"
      @all_tag = 'btn btn-light active'
      @displaying_items = @items
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
    
    @all_tags.each do |t|
      puts params[t]
    end
     @all_colour.each do |t|
       puts params[t]
    end
     @all_size.each do |t|
       puts params[t]
    end
    
    temp = @displaying_items
    @displaying_items = []
    filtered = false
    
    @all_tags.each do |t|
      if params[t] != nil
        puts(t)
       temp.each do |i|
         if i.tag.include?(params[t])
           if !@displaying_items.include?(i) 
             @displaying_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    if !filtered
      @displaying_items = temp
    end
    
    
    temp = @displaying_items
    @displaying_items = []
     filtered = false
    @all_colour.each do |t|
      if params[t] != nil
        puts(t)
       temp.each do |i|
         if i.colour.include?(params[t])
           if !@displaying_items.include?(i) 
             @displaying_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    if !filtered
      @displaying_items = temp
    end
    
    temp = @displaying_items
    @displaying_items = []
     filtered = false
    @all_size.each do |t|
      if params[t] != nil
        puts(t)
       temp.each do |i|
         if i.size.include?(params[t])
           if !@displaying_items.include?(i) 
             @displaying_items.append(i)
             filtered = true
           end
         end
       end
     end
    end
    
    if !filtered
      @displaying_items = temp
    end
  end
  
end
