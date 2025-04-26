class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :tz, limit: 64

      t.timestamps
    end
  end
end
