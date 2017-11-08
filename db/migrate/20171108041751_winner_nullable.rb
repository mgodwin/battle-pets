class WinnerNullable < ActiveRecord::Migration[5.1]
  def change
    change_table :contests do |t|
      t.change :winner_id, :integer, null: true
    end
  end
end
