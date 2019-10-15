class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :access
      t.string :schedule
      t.integer :member
      t.text :review

      t.timestamps
    end
  end
end
