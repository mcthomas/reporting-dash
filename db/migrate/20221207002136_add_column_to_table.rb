class AddColumnToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :elgibilitylists, :entry, index: true
  end
end
