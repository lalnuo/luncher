class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.integer :lunch_id

      t.timestamps null: false
    end
  end
end
