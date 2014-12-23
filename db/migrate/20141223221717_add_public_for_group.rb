class AddPublicForGroup < ActiveRecord::Migration
  def change
    add_column :groups, :public, :boolean
  end
end
