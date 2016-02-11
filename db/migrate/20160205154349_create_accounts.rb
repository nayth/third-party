class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret
      t.string :url
      t.boolean :active

      t.timestamps null: false
    end
  end
end
