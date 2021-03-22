class AddContestIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :contest_id, :integer
  end
end
