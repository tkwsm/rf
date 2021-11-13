class DbpathsController < ApplicationController
  before_action :set_dbpath, only: %i[ show edit update destroy ]

  # GET /dbpaths or /dbpaths.json
  def index
#    @dbpaths = Dbpath.find(params[:id])
    @dbpaths = Dbpath.all
#    @dbpaths = Dbpath.select(:id, :abbreviation)
  end

  # GET /dbpaths/1 or /dbpaths/1.json
  def show
    @dbpaths = Dbpath.all
  end

  # GET /dbpaths/new
  def new
    @dbpath = Dbpath.new
  end

  # GET /dbpaths/1/edit
  def edit
  end

  # POST /dbpaths or /dbpaths.json
  def create
    @dbpath = Dbpath.new(dbpath_params)

    respond_to do |format|
      if @dbpath.save
        format.html { redirect_to @dbpath, notice: "Dbpath was successfully created." }
        format.json { render :show, status: :created, location: @dbpath }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dbpath.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dbpaths/1 or /dbpaths/1.json
  def update
    respond_to do |format|
      if @dbpath.update(dbpath_params)
        format.html { redirect_to @dbpath, notice: "Dbpath was successfully updated." }
        format.json { render :show, status: :ok, location: @dbpath }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dbpath.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dbpaths/1 or /dbpaths/1.json
  def destroy
    @dbpath.destroy
    respond_to do |format|
      format.html { redirect_to dbpaths_url, notice: "Dbpath was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dbpath
      @dbpath = Dbpath.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dbpath_params
      params.require(:dbpath).permit(:project_id, :abbreviation, :sequence_type, :db_path)
    end
end
