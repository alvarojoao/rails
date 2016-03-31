class CreateTargetings < ActiveRecord::Migration
  def change
    create_table :targetings do |t|
      t.string :places
      t.integer :genero
      t.references :ad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
