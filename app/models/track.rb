class Track < ActiveRecord::Base
  attr_accessible :album, :artist, :song, :title, :user_id
  
end
