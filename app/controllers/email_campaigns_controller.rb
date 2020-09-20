class EmailCampaignsController < ApplicationController
  def index
    Rails.logger.debug "email_campaign.index()"
    
    email_campaigns = EmailCampaign.all
    render json: email_campaigns, status: 200
  end
  
  def create
    email_campaign = EmailCampaign.new(email_campaign_params)

    if email_campaign.save
      render json: email_campaign, status: 200
    else
      render json: "unable to create email campaign", status: 400
    end
  end

  def update
    email_campaign = EmailCampaign.find(params[:id])

    if @email_campaign.update_attributes(email_campaign_params)
      render json: email_campaign, status: 200
    else
      render json: "unable to update email campaign", status: 400
    end
  end

  def send_email_campaign
    email_campaign = EmailCampaign.find(params[:id])

    email_campaign.users.each do |user, i|
      Rails.logger.debug "Sending emailCampaign #{email_campaign.name} to user: #{user.first_name} #{user.last_name}"
    end
  end
  
  private

  def email_campaign_params
    params.require(:email_campaign_params).permit(
      :campaign_name,
      :email_sender,
      :discount_code,
      :discount_rate,
      :max_send_per_user
    )
  end  
end
