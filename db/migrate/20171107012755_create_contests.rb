class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      t.text :type
      t.integer :status
      t.integer :winner_id
      t.timestamps
    end
  end
end
