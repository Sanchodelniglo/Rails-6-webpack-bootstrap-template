class AddAddressToChallenge < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :address, :string, null: false
  end
end
