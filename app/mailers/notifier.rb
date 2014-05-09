class Notifier < ActionMailer::Base
  default :from => "ror1github@gmail.com"

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up' )
  end
  def send_admin_email(user)
    @user = user
    mail( :to => User.find_by_username("ankur").email,
    :subject => 'New User Signed Up for EP Engagement Tool' )
  end
  def send_confirmation_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your application has been verified and accepted' )
  end
end
