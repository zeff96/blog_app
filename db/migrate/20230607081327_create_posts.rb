class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}, index: true
      t.string :title
      t.text :text
      t.string :comments_counter
      t.string :likes_counter

      t.timestamps
    end
  end
end
