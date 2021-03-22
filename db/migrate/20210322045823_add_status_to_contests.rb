class AddStatusToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :status, :integer, default: 0
  end
end
