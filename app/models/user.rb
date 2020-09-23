class User < ApplicationRecord
  # DB Relationships
  has_and_belongs_to_many :email_campaigns

  # Callbacks
  before_save :downcase_name_and_email

  # Validations
  validates :name,
    presence: true,
    length: {
      minimum: 2,
      maximum: 100
    }

  validates :email,
    presence: true,
    length: {
      minimum: 7,
      maximum: 255
    },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  
  # Class Methods

  private

  def downcase_name_and_email
    self.email = email.downcase
    self.name = name.downcase
  end  
end
