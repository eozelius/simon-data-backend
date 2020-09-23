class CreateEmailCampaignsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :email_campaigns, :users
  end
end
