class EmailCampaignsController < ApplicationController
  def send_email_campaign
    email_campaign = EmailCampaign.find_or_create_by(email_campaign_params)
    email_campaign.create_recipients_list(params[:recipients])

    if email_campaign.valid?
      email_campaign.send_email_campaign
    else
      render json: {
        message: 'Could not send email campaign.',
        errors: email_campaign.errors.full_messages
      }, status: 400
    end
  end

  private

  def email_campaign_params
    params.require(:campaign).permit(
      :name,
      :description,
      :subject,
      :discount_rate,
      :discount_code,
      :sender
    )
  end
end
