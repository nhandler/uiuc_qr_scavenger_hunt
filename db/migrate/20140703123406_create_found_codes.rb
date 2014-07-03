class CreateFoundCodes < ActiveRecord::Migration
  def change
    create_table :found_codes do |t|
      t.integer :code_id
      t.integer :user_id

      t.timestamps
    end
  end
end
