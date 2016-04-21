class NotepadsController < ApplicationController
  def new
    #Generate a random url identifier. Later, this should create a more human friendly result. 
    @notepad = Notepad.new({url: SecureRandom.uuid.upcase!})
  end

  def create
    
    #Check if the entry was blank, if so use the placeholder url. 
    if params[:notepad][:url] == ""
      params[:notepad][:url] = params[:notepad][:orig_url]
    end

    #Save the new notepad, then redirect to it. If the notepad already exists, this will redirect to the existing notepad. 
    @notepad = Notepad.new(notepad_params)
    @notepad.save

    redirect_to notepad_path @notepad.url
  end

  def show
    #Find the notepad by the url identifier, rather than ID. 
    @notepad = Notepad.find_by(url: params[:id])
  end

  private
    def notepad_params
      params.require(:notepad).permit(:url)
    end
end
