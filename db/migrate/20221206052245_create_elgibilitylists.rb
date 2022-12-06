class CreateElgibilitylists < ActiveRecord::Migration[7.0]
  def change
    create_table :elgibilitylists do |t|
      t.string :title

      t.timestamps
    end
  end
end
