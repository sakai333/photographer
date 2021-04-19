class AddVotesNumToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :votes_num, :integer, null: false, default: 0
  end
end
