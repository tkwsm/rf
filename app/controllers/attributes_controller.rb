class AttributesController < ApplicationController

  def index
    @msg  = 'Attributes data.'
    @maxgattrid = Attribute.maximum(:id)
    if params[:project_id] != nil
      @data_pages = Attribute.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = Attribute.page params[:page]
    end
  end

  def show
    @msg  = 'Indexed data.'
    @data = Attribute.find(params[:id])
  end

end
