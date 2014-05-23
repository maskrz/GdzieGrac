class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :number_of_baskets
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
