class ProteinsController < ApplicationController
  def index
    @maxtid = 0
    if params[:project_id] != nil
      @data_pages = Protein.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = Protein.page params[:page]
    end
    @maxtid = Protein.maximum(:id)
  end
end
