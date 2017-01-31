class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.belongs_to :category, foreign_key: true
    end
  end
end
