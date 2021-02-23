class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :country
      t.text :text

      t.timestamps
    end
  end
end
