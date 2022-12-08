class CreateEligibilitylists < ActiveRecord::Migration[7.0]
  def change
    create_table :eligibilitylists do |t|
      t.string :title
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :string
      t.boolean :a1
      t.boolean :a2
      t.boolean :a3
      t.boolean :a4
      t.boolean :a5
      t.boolean :a6
      t.boolean :a7
      t.boolean :a8
      t.boolean :a9
      t.boolean :a10

      t.timestamps
    end
  end
end
