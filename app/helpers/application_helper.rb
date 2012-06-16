module ApplicationHelper
  def download_url_for(song_key)  
      AWS::S3::S3Object.url_for(song_key, 'hackatrain', :authenticated => false)  
  end
  
  def find_user(song_key)
    upload = Upload.find_by_name song_key
    user = User.find_by_id upload.user_id
    return user.username
  end
end
