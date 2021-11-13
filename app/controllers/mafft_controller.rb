class MafftController < ApplicationController
  protect_from_forgery

  def align
  end

  def alignout
    @mafftout=params[:nickname]
  end

end
