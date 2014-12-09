class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :name
      t.integer :group_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
