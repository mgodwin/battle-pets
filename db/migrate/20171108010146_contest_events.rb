class ContestEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :contest_events do |t|
      t.text :description
      t.references :contests, null: false, foreign_key: true
      t.timestamps
    end
  end
end
