class CreateGenreUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_users do |t|
      t.references :user, index: true
      t.references :genre, index: true, foreign_key: true
      t.timestamps
      t.timestamps
    end
  end
end
