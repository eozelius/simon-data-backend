# Preview all emails at http://localhost:3000/rails/mailers/simon_mailer
class SimonMailerPreview < ActionMailer::Preview
  def send_generic_email_campaign
    campaign = EmailCampaign.find(2)
    SimonMailer.send_generic_email_campaign(campaign)
  end
end
