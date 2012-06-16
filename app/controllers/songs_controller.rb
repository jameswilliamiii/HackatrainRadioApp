class SongsController < ApplicationController
  
  # before_filter :require_login
  
  def index
    @songs = AWS::S3::Bucket.find('hackatrain').objects 

  end

  def upload
    begin
      AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, 'hackatrain', :access => :public_read)
      redirect_to root_path
      
    rescue  
      render :text => "Couldn't complete the upload"  
    end
  end

  def delete
    if (params[:song])  
        AWS::S3::S3Object.find(params[:song], 'hackatrain').delete  
        redirect_to root_path  
    else  
        render :text => "No song was found to delete!"  
    end
  end
  
  def hell_yeah
    upload = Upload.find_by_id params[:name]
    new_value = upload.like + 1
    upload.update_attributes(:like => new_value)
    redirect_to root_path
  end

  def totally_bunk
    upload = Upload.find_by_id params[:name]
    new_value = upload.like - 1
    upload.update_attributes(:like => new_value)
    redirect_to root_path
  end
  
  private  

  def sanitize_filename(file_name)  
      just_filename = File.basename(file_name)  
      just_filename.sub(/[^\w\.\-]/,'_')  
  end

end
