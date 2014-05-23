class CreateAths < ActiveRecord::Migration
  def change
    create_table :aths do |t|
      t.string :name

      t.timestamps
    end
  end
end
