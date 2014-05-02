class ChangeOpenTrucksToDateTime < ActiveRecord::Migration
  def change
    change_column :open_trucks, :openUntil, :datetime
  end
end
