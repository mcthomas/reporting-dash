class AddAssociateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :associate, :boolean, default: true
  end
end
