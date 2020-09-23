class CreateEmailCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :email_campaigns do |t|
      t.string :name
      t.text :description
      t.string :sender, default: 'do-not-reply@simondata.com'
      t.string :subject
      # email_recipient determined by self.users[]
      t.string :discount_code
      t.integer :discount_rate

      # TODO: By default send no more than 3 emails to the same email address.
      # t.integer :max_send_per_user, default: 3

      # Send Email campaign once every 7 days
      # TODO interval - set a repeating job to send an email on constant interval
      # t.integer :interval, default: 7
      t.timestamps
    end
  end
end
