class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.decimal :budget, precision: 11, scale: 2

      t.timestamps null: false
    end
  end
end
