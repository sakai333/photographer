class AddPrizeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :prize, :integer
  end
end
