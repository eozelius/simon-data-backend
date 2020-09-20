Rails.application.routes.draw do
  resources :email_campaigns, only: [ :create, :update, :index ]
  post 'send-email', to: 'email_campaign#send_email_campaign'
end
