class CreateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.json :attributes, null: false
      t.references :contest, null: false, foreign_key: true
      t.timestamps
    end
  end
end
