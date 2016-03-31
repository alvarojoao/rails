class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.decimal :bid, precision: 11, scale: 2
      t.text :adText
      t.references :ad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
