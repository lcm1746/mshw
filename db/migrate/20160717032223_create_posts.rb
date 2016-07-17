class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject_code
      t.string :subject_name
      t.string :option
      t.string :lecturer
      t.text :content
      t.integer :rating
      t.integer :hits

      t.timestamps null: false
    end
  end
end
