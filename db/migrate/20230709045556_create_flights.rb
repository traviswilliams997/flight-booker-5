class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.date :Date
      t.time :Time
      t.integer :Duration
      t.references :DepartureAirport, null: false, foreign_key: { to_table: :airports }
      t.references :DestinationAirport, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
