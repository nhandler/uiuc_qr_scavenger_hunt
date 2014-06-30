class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :clue
      t.string :location
      t.string :specific_location
      t.string :alum
      t.string :secret

      t.timestamps
    end
  end
end
