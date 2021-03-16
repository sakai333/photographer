class AddImageToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :image, :string
  end
end
