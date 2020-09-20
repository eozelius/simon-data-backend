# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Users and EmailCampaigns associations must be made manually
# $ rails c
# user = User.find(id)
# email_campaign = EmailCampaign.find(id)
# email_campaign.users << user
# email_campaign.save!

sammy = User.create(
  first_name: 'sammy',
  last_name: 'samwell',
  email: 'sammy.samwell2020@mailinator.com'
)

alex = User.create(
  first_name: 'alex',
  last_name: 'andersson',
  email: 'alex.andersson2020@mailinator.com'
)

taylor = User.create(
  first_name: 'taylor',
  last_name: 'tolstoy',
  email: 'alex.tolstoy2020@mailinator.com'
)

hats_50 = EmailCampaign.create(
  campaign_name: 'hats_50',
  email_sender: 'do-not-reply@hats50.simon-data.com',
  discount_code: 'SIMON_HATS_50',
  discount_rate: 50,
  max_send_per_user: 3
)

shoes_20 = EmailCampaign.create(
  campaign_name: 'shoes_20',
  email_sender: 'do-not-reply@shoes20.simon-data.com',
  discount_code: 'SIMON_SHOES_20',
  discount_rate: 20,
  max_send_per_user: 5
)