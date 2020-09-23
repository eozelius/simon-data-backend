class EmailCampaign < ApplicationRecord
  # DB relationships
  has_and_belongs_to_many :users

  # Validations
  # name
  validates :name,
    presence: true,
    length: {
      minimum: 2,
      maximum: 50
    }

  # description
  validates :description,
    presence: true,
    length: {
      minimum: 2,
      maximum: 500
    }

  # subject
  validates :subject,
    presence: true,
    length: {
      minimum: 2,
      maximum: 200
    }

  # sender
  validates :sender,
    presence: true,
    length: {
      minimum: 7,
      maximum: 255
    },
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    },
    uniqueness: {
      case_sensitive: false
    }

  # discount_code
  validates :discount_code,
    presence: true,
    length: {
      minimum: 2,
      maximum: 50
    }

  # discount_rate
  validates :discount_rate,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 100
    }

  # max_send_per_user
  # validates :max_send_per_user,
  #   numericality: {
  #     only_integer: true,
  #     less_than: 10
  #   }

  # TODO interval - set a repeating job to send an email on constant interval
  # validates :interval, numericality: { only_integer: true, greater_than: 0, less_than: 365 }

  # Class Methods
  def create_recipients_list(recipients)
    users = []
    errors = []
    response = {}

    recipients.each do |recipient_param, i|
      user = User.find_or_create_by(
        email: recipient_param[:email].downcase,
        name: recipient_param[:name].downcase
      )

      if user
        self.users << user
      else
        self.errors.add(:base, :invalid, message: 'unable to create user')
      end
    end

    return self
  end

  # Mailers
  def send_email_campaign
    SimonMailer.send_generic_email_campaign(self).deliver_now
  end
end
