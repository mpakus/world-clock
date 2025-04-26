class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.references :space, null: false, foreign_key: true
      t.references :timezone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
