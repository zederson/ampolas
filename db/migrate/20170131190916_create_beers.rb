class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.belongs_to :brewery, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.belongs_to :style, foreign_key: true
      t.string :name
      t.float :abv
      t.float :ibu
      t.float :srm
      t.float :upc
      t.string :description
    end
  end
end
