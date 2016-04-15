class NotepadsController < ApplicationController
  def new
    @notepad = Notepad.new({url: SecureRandom.uuid})
  end

  def create
    @notepad = Notepad.new(notepad_params)
    
    if @notepad.save
      redirect_to notepad_path @notepad.url
    else
      render 'show'
    end
  end

  def show
    @notepad = Notepad.find_by(url: params[:id])
  end

  private
    def notepad_params
      params.require(:notepad).permit(:url)
    end
end
