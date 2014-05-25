class ChangeFieldDescType < ActiveRecord::Migration
  def change
    change_column :fields, :description, :text
  end
end
