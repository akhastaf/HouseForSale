class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.string :price
      t.text :description

      t.timestamps null: false
    end
    add_index :houses, :title, unique: true
  end
end
