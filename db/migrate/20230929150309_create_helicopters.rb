class CreateHelicopters < ActiveRecord::Migration[7.0]
  def change
    create_table :helicopters do |t|
      t.string :name
      t.text :description
      t.string :contact
      t.decimal :price
      t.decimal :carriage_capacity
      t.integer :model
      t.string :image

      t.timestamps
    end
  end
end
