class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
