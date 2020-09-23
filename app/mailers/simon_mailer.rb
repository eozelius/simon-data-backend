class SimonMailer < ApplicationMailer
  def send_generic_email_campaign(campaign)
    @campaign = campaign

    @campaign.users.each do | u, index |

      begin
        mail(
          to: u.email,
          subject: @campaign.subject
        )
      rescue => exception
        p "EXCEPTION!!!! => #{exception}"
      end
    end
  end
end
