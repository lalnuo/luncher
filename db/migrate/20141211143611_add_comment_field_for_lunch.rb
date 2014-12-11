class AddCommentFieldForLunch < ActiveRecord::Migration
  def change
    add_column :lunches, :info, :string
  end
end
