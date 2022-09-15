class CreateThroneRoom < ActiveRecord::Migration[5.2]
  def change
    create_table :throne_rooms do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :directions
      t.integer :baby_changing_station
      t.integer :bathroom_style
      t.integer :key_code_required

      t.timestamps
    end
  end
end
