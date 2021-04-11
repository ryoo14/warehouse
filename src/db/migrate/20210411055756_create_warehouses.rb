class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.integer :count
      t.string :category

      t.timestamps
    end
  end
end
