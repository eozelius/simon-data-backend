class EmailCampaign < ApplicationRecord
  # DB relationships
  has_many :users

  # Validations
  # campaign_name
  validates :campaign_name, presence: true, length: { minimum: 2, maximum: 50 }

  # email_sender
  validates :email_sender, presence: true, length: { minimum: 7, maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  # email_recipient determined by self.users
  # validates :email_recipient, presence: true, length: { minimum: 7, maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  # discount_code
  validates :discount_code, presence: true, length: { minimum: 2, maximum: 50 }

  # discount_rate
  validates :discount_rate, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }

  # TODO interval - set a repeating job to send an email on constant interval
  # validates :interval, numericality: { only_integer: true, greater_than: 0, less_than: 365 }

  # max_send_per_user
  validates :max_send_per_user, numericality: { only_integer: true, less_than: 10 }

  # Send email methods
  # def send_email_campaign
  #   UserMailer.welcome_to_driftmap(self).deliver_now
  # end
end
