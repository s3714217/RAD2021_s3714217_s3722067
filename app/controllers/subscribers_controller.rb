class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.all
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  #Create an subscriber and send user an email
  def create
    if Subscriber.where(email: params["subscriber"]["email"]).empty?
      @subscriber = Subscriber.new(subscriber_params)
      respond_to do |format|
        if @subscriber.save
          UserNewsletterMailer.send_signup_email(@subscriber).deliver_now
          format.html { redirect_to :root, notice: 'Subscription was successfully created.' }
          format.json { render :show, status: :created, location: @subscriber }
        else
          format.html { redirect_to :root, notice: 'Subscription was not able to be created.'}
          format.json { render json: @subscriber.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to main_main_path, notice: 'You are already subscribed' 
    end
  end
  
  #Toggle subscriber status  
  def toggle_create
    if Subscriber.where(email: params["subscriber"]["email"]).empty?
      @subscriber = Subscriber.new(subscriber_params)
      respond_to do |format|
        if @subscriber.save
          UserNewsletterMailer.send_signup_email(@subscriber).deliver_now
          format.html { redirect_to main_profile_path, notice: 'Subscription was successfully created.' }
          format.json { render :show, status: :created, location: @subscriber }
        else
          format.html { redirect_to main_profile_path, notice: 'Subscription was not able to be created.'}
          format.json { render json: @subscriber.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to main_main_path, notice: 'You are already subscribed' 
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      UserNewsletterMailer.send_breakup_email(@subscriber).deliver_now
      format.html { redirect_to main_profile_path, notice: 'You have now unsubscribed to the newsletter.' }
      format.json { head :no_content }
    end
  end
  
  def toggle_subscriber
    user = User.find_by id: session[:current_user_id]
    subscriber = Subscriber.where(email: user.email)
     
    if subscriber.empty?
      new()
      toggle_create()
    else
      @subscriber = Subscriber.find(subscriber.ids[0])
      destroy()
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
