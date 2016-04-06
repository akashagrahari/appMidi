class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "first_name", :limit => 40
      t.string "last_name", :limit => 50
      t.string "email", :null => false, :limit => 100
      t.string "hashed_password", :limit => 40, :null => false
      t.integer :type
      t.timestamps null: false
    end
    add_index("users","email")
  end

  def down
    remove_index("users","email")
    drop_table :users
  end
end
