class LinkWinnerToContestants < ActiveRecord::Migration[5.1]
  def change
    change_table :contests do |t|
      t.change :winner_id, :integer, null: false
    end
    add_foreign_key :contests, :contestants, column: :winner_id
  end
end
