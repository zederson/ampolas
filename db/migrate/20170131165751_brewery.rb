class Brewery < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :complement
      t.string :city
      t.string :state
      t.string :code, index: true
      t.string :country
      t.string :phone
      t.string :site
      t.string :description
      t.timestamps
    end
  end
end
