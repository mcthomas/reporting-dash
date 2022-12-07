class AddEntryCol < ActiveRecord::Migration[7.0]
  def change
    add_reference :entries, :elgibilitylist, index: true
  end
end
