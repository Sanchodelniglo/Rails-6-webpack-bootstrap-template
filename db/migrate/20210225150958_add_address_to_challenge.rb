class AddAddressToChallenge < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :address, :string, null: false
    add_column :challenges, :latitude, :decimal, precision: 10, scale: 6
    add_column :challenges, :longitude, :decimal, precision: 10, scale: 6
    add_column :challenges, :search_radius, :integer, default: 100
  end
end
