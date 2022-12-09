class AddLeadToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lead, :boolean, default: false
  end
end
