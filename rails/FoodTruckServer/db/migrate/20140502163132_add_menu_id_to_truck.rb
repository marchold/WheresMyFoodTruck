class AddMenuIdToTruck < ActiveRecord::Migration
  def change
    add_column :trucks, :menu_id, :integer
  end
end
