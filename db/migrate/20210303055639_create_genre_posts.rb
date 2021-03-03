class CreateGenrePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_posts do |t|
      t.references :post, index: true
      t.references :genre, index: true, foreign_key: true
      t.timestamps
    end
  end
end
