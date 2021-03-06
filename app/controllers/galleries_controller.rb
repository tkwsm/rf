class GalleriesController < ApplicationController

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to '/galleries/catalog'
#      redirect_to gallery_path, 'something'
    else
      render :new
    end

#    @gallery.update(gallery_params)
#    redirect_to '/galleries/catalog'

  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def viewer
    @link       = params[:link]
    @project_id = params[:id]
    @gallery = Gallery.find(params[:id])
  end

  def catalog
    @galleries = []
#    @galleries = Gallery.where( "id = ?", 4 ) ###
    @galleries = Gallery.all
  end

  def create
    @gallery = Gallery.new
    if @gallery.save
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to '/galleries/catalog', 
        notice: 'Gallery was successfully destroyd.' }
      format.json { head :no_content }
    end
  end

  private

    def gallery_params
      params.require(:gallery).permit(:id, :species_name, :common_name,
                               :sort_number, :description, :version, :url_link,
                               :image_link, :ncbi_taxonomy_id )
    end

end
