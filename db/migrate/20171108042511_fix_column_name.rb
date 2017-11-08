class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    change_table :contest_events do |t|
      t.remove :contests_id
      t.references :contest, null: false, foreign_key: true
    end
  end
end
