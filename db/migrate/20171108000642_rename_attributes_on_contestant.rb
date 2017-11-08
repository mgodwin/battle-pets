class RenameAttributesOnContestant < ActiveRecord::Migration[5.1]
  def change
    change_table :contestants do |t|
      t.rename :attributes, :contestant_attributes
    end
  end
end
