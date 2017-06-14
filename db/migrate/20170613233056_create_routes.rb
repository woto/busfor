class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :city_start, foreign_key: {to_table: :cities}
      t.references :station_start, foreign_key: {to_table: :stations}
      t.datetime :date_start
      t.references :city_end, foreign_key: {to_table: :cities}
      t.references :station_end, foreign_key: {to_table: :stations}
      t.datetime :date_end
      t.references :carrier, foreign_key: true
      t.money :cost
      t.integer :currency, default: 0

      t.timestamps
    end
  end
end
