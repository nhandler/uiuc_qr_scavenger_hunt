class DropAvailableCodes < ActiveRecord::Migration
  def change
    drop_table :available_codes
  end
end
