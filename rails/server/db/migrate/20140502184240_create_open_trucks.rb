class CreateOpenTrucks < ActiveRecord::Migration
  def change
    create_table :open_trucks do |t|
      t.string :truck_id
      t.string :openUntil

      t.timestamps
    end
  end
end
