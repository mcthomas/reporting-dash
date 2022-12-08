class AddAssignToEligibilitylist < ActiveRecord::Migration[7.0]
  def change
    add_column :eligibilitylists, :assign, :string
  end
end
