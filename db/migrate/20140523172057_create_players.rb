class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
