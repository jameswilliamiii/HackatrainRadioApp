class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song
      t.integer :user_id
      t.string :artist
      t.string :album
      t.string :title

      t.timestamps
    end
  end
end
