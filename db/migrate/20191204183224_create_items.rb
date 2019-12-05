class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :court
      t.date :day
      t.integer :hour
      t.boolean :is_booked

      t.timestamps
    end
  end
end
