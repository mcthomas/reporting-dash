class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.string :when
      t.string :where

      t.timestamps
    end
  end
end
