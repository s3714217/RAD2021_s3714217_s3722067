class UserNewsletterMailer < ApplicationMailer
  default :from => 'rubysendinmail123@gmail.com'
  
  def send_signup_email(subscriber)
    @subscriber = subscriber
    mail( :to => @subscriber.email,
    :subject => 'Newsletter Subscription',
    :body => "Thanks for subscribing to our store newsletter")
  end
  
  def send_breakup_email(subscriber)
    @subscriber = subscriber
    mail( :to => @subscriber.email,
    :subject => 'Newsletter Unsubscribe',
    :body => "We are sorry to hear you are unsubscribing to our store newsletter")
  end
  
end
