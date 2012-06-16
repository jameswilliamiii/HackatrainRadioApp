class DropTracks < ActiveRecord::Migration
  def up
    remove_column :tracks, :lesson_path
    add_column :tracks, :name, :string
  end

  def down
    add_column :tracks, :lesson_path, :string
  end
end
