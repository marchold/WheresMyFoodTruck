class AddTokenToOpenTrucksTable < ActiveRecord::Migration
  def change
     add_column :open_trucks, :token, :string
  end
end
