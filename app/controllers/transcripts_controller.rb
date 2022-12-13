class TranscriptsController < ApplicationController

  def index
    @maxtid = 0
    if params[:project_id] != nil
      @data_pages = Transcript.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = Transcript.page params[:page]
    end
    @maxtid = Transcript.maximum(:id)
  end

end
