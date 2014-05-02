class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :description
      t.string :menu_id
      t.float :price

      t.timestamps
    end
  end
end
