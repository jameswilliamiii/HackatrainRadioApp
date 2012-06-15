class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :title, :user_id, :track
  has_attached_file :track,
                    :storage => :s3,
                    :path => 'assets/:class/:id/:style.:extension',
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :s3_permissions => 'authenticated-read',
                    :s3_protocol => 'http',
                    :url => ':s3_path_url'
                  
  validates_attachment_presence :track
  validates_attachment_content_type :track, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
  validates_attachment_size :track, :less_than => 20.megabytes
  
  # before_save :get_metadata
  # 
  # 
  # def audio?
  #   upload_content_type =~ %r{^audio/(?:mp3|mpeg|mpeg3|mpg|x-mp3|x-mpeg|x-mpeg3|x-mpegaudio|x-mpg)$}
  # end
  # 
  # def display_name
  #   @display_name ||= if audio? && metadata?
  #     artist, title = metadata.values_at('artist', 'title')
  #     title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : upload_file_name
  #   else
  #     upload_file_name
  #   end
  # end
  # 
  # private
  #  
  #  
  #  def get_metadata
  #        path = track.queued_for_write[:original].path
  #        Mp3Info.open(path) do |mp3info|
  #          self.title = mp3info.tag.title
  #          self.save
  #        end
  #    end
  
end
