class CreateEplayers < ActiveRecord::Migration
  def change
    create_table :eplayers do |t|
      t.references :player
      t.references :event
      t.timestamps
    end
  end
end
