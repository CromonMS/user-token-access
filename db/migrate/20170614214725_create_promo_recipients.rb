class CreatePromoRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :promo_recipients do |t|
      t.integer :promo_id
      t.integer :recipient_id
      t.string :access_token

      t.timestamps

      t.index :promo_id
      t.index :recipient_id
      t.index :access_token
    end
  end
end
