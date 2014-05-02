class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.float :lng
      t.float :lat
      t.string :name

      t.timestamps
    end
  end
end
