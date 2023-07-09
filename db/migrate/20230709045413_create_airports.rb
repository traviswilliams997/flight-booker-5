class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :Code
      t.string :City

      t.timestamps
    end
    add_index :airports, :Code, unique: true
  end
end
