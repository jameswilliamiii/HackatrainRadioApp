class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :artist
      t.string :album

      t.timestamps
    end
  end
end
