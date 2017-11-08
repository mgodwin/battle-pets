class AssociateContestToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :contests do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
