# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
UserAuth::Application.initialize!
UserAuth::Application.configure do
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            'ror1github@gmail.com',
  password:             'devotestror1',
  authentication:       'plain',
  enable_starttls_auto: true  }
 end