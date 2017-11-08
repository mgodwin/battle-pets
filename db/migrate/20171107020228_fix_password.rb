class FixPassword < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :password
      t.text :password_digest, null: false
      t.change :username, :text, null: false
    end
  end
end
