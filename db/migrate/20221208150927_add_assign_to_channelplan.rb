class AddAssignToChannelplan < ActiveRecord::Migration[7.0]
  def change
    add_column :channelplans, :assign, :string
  end
end
