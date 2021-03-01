class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :place_id
      t.boolean :open
      t.integer :rating
      t.integer :cost

      t.timestamps
    end
  end
end
