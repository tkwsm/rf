class GalleriesController < ApplicationController
  def new
  end

  def show
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

  private

    def gallery_params
      params.require(:gallery).permit(:url_link)
    end
end
