class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :email, null: false
      t.boolean :accepted, default: false
      t.references :user_challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
