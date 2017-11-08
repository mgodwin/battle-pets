class DropUsersTable < ActiveRecord::Migration[5.1]
  def change
    change_table :contests do |c|
      c.remove :user_id
    end
    drop_table :users
  end
end
