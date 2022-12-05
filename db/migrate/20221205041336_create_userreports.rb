class CreateUserreports < ActiveRecord::Migration[7.0]
  def change
    create_table :userreports do |t|
      t.integer :users
      t.integer :usersactive
      t.integer :usersinactive
      t.integer :usersvalidated
      t.integer :usersnotvalidated

      t.timestamps
    end
  end
end
