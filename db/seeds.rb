# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Users and EmailCampaigns associations must be made manually
# $ rails c
# user = User.find(id)
# email_campaign = EmailCampaign.find(id)
# email_campaign.users << user
# email_campaign.save!

sammy = User.create(
  name: 'sammy samwell',
  email: 'sammy.samwell2020@mailinator.com'
)

alex = User.create(
  name: 'alex andersson',
  email: 'alex.andersson2020@mailinator.com'
)

taylor = User.create(
  name: 'taylor tolstoy',
  email: 'alex.tolstoy2020@mailinator.com'
)

hats_50 = EmailCampaign.create(
  name: 'Simon Data - End of Winter Hat Sale',
  subject: 'Simon Data Hats Sale: Keep your head warm with a new Hat!',
  sender: 'do-not-reply@hats50.simon-data.com',
  description: 'SimonData Winter Sale promotion.  Right now take 50% off all your favorite Hats!',
  discount_code: 'SIMON_HATS_50',
  discount_rate: 50
)

shoes_20 = EmailCampaign.create(
  name: 'SimonData - End of Summer Shoe Sale',
  subject: 'Simon Data Sale: Lace up some new Shoes!',
  sender: 'do-not-reply@simondata.com',
  description: 'Take a walk in the Park with SimonData Shoes Summer discount promotion: 20% off all online purchases.  ',
  discount_code: 'SIMON_SHOES_20',
  discount_rate: 20
)