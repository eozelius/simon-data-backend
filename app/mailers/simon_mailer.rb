class SimonMailer < ApplicationMailer
  def send_shoe20_email(user)
    @user = user
    mail(to: @user.email, subject: '20% off simon shoes!' )
  end
end
