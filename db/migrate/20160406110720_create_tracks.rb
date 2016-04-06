class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer "user_id", :null => false
      t.string "name", :limit => 40, :null => false
      t.string "artist", :limit => 50
      t.integer :access_level
      t.string "location", :null => false
      t.string "genre"
      t.integer "views"
      t.timestamps null: false
    end
    add_index("tracks","name")
    add_index("tracks","artist")
    add_index("tracks","access_level")
    add_index("tracks","user_id")
    add_index("tracks", "genre")
    add_index("tracks", "views")
  end
end
