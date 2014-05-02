class CreateTrucksUsers < ActiveRecord::Migration
  def change
    create_table :trucks_users, :id => false do |t|
      t.integer :truck_id
      t.integer :user_id
    end

    add_index :trucks_users, :truck_id
    add_index :trucks_users, :user_id
  end
end
