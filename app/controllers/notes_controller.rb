class NotesController < ApplicationController
  def create
    @notepad = Notepad.find(params[:notepad_id])
    @note = @notepad.notes.create(note_params)
    redirect_to notepad_path @notepad.url
  end

  def update
    @notepad = Notepad.find(params[:notepad_id])
    @note = @notepad.notes.find(params[:id])
    @note.update(note_params)

    redirect_to notepad_path @notepad.url
  end

  def destroy
    @notepad = Notepad.find(params[:notepad_id])
    @note = @notepad.notes.find(params[:id])
    @note.destroy
    redirect_to notepad_path @notepad.url
  end

  private
    def note_params
      params.require(:note).permit(:text)
    end
end
