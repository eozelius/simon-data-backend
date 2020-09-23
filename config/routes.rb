Rails.application.routes.draw do
  post 'send-email', to: 'email_campaigns#send_email_campaign'
end
