class BreweryGeocodes < ActiveRecord::Migration[5.0]
  def change
    create_table :brewery_geocodes do |t|
      t.float :latitude
      t.float :longitude
      t.string :accuracy
      t.belongs_to :brewery, foreign_key: true
      t.timestamps
    end
  end
end
