class AddTitleToUserreports < ActiveRecord::Migration[7.0]
  def change
    add_column :userreports, :title, :string
  end
end
