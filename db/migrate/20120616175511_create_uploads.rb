class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :user_id
      t.string :url
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
