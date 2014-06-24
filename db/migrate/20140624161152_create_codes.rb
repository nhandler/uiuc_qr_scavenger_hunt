class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :clue
      t.string :location
      t.string :secret

      t.timestamps
    end
  end
end
