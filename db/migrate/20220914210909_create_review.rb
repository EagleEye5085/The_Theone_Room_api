class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :cleanliness
      t.integer :ambiance
      t.integer :tp_quality
      t.integer :privacy
      t.string :other_comments
      t.references :throne_room, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
