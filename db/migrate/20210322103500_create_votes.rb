class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :contest_id
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
