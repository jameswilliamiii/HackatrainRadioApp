class AddNameToUploads < ActiveRecord::Migration
  def up
    remove_column :uploads, :url
    add_column :uploads, :name, :string
  end

  def down
    add_column :uploads, :url, :string
  end
end
