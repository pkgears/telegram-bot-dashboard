class CreateBots < ActiveRecord::Migration[7.0]
  def change
    create_table :bots do |t|
      t.string :name
      t.string :username
      t.string :token

      t.timestamps
    end
  end
end
