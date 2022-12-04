class CreateChannelplans < ActiveRecord::Migration[7.0]
  def change
    create_table :channelplans do |t|
      t.string :channel
      t.string :name
      t.string :structure
      t.string :tone
      t.string :action

      t.timestamps
    end
  end
end
