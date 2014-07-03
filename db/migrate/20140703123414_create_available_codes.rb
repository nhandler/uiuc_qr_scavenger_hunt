class CreateAvailableCodes < ActiveRecord::Migration
  def change
    create_table :available_codes do |t|
      t.integer :code_id
      t.integer :user_id

      t.timestamps
    end
  end
end
