class HomeController < ApplicationController
  
  def index
    redirect_to action: "learn"
  end

  def learn
    @track = Track.new
  end

  def play
  end

  def contribute
  end

  def about
  end

  def mytracks
  end

  def browse
  end

  def submit_song
    @track = Track.new(track_params)
    @track[:isPublic] = 1
    @track[:user_id] = session[:user_id]
    if @track.save
      flash[:success] = 'Midi File successfully uploaded'
      redirect_to(:controller => 'home', :action => 'learn')
    else
      flash[:danger] = 'Something went wrong. Check data again'
      redirect_to(:controller => 'home', :action => 'learn')
    end
  end

  private

  def track_params
    params.require(:track).permit(:name,:artist,:genre,:midi_file)
  end
end
