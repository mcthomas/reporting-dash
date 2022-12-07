class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :scenario
      t.boolean :check
      t.string :date

      t.timestamps
    end
  end
end
