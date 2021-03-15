class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string      :name
      t.text        :condition
      t.date        :period
      t.timestamps
    end
  end
end
