class TattributesController < ApplicationController

  def index
    @msg  = 'Tattributes data.'
    @maxtattrid = Tattribute.maximum(:id)
    if params[:project_id] != nil
      @data_pages = Tattribute.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = Tattribute.page params[:page]
    end
  end

  def show
    @msg  = 'Indexed data.'
    @data = Tattribute.find(params[:id])
  end

end
