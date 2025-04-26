class CreateTimezones < ActiveRecord::Migration[8.0]
  def change
    create_table :timezones do |t|
      t.string :tz
      t.string :utc
      t.string :names, array: true, default: []

      t.timestamps
    end
  end
end
