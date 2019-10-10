class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string  :area
      t.string :prefectures
      t.string :range
      t.integer :elevation
      t.text :overview
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
