class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :building
      t.integer :capacity

      t.timestamps
    end
  end
end
