class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true, unique: true

      # EmailCampaign.has_many :users
      t.references :email_campaign, index: true, foreign_key: true

      t.timestamps
    end
  end
end
