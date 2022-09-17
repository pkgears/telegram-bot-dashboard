class AddPidToBots < ActiveRecord::Migration[7.0]
  def change
    add_column :bots, :pid, :integer
  end
end
