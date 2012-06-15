class SongsController < ApplicationController
  
  def index
    @song = Song.new
    @songs = Song.all
  end

  def upload
    @song = Song.create params[:song]
    if @song.save
      redirect_to root_path
    else
      render 'index', notice: 'Oh snap, something went wrong!'
    end
  end

  def delete
    
  end
end
