class ProteinSeqsController < ApplicationController
  before_action :set_protein_seq, only: %i[ show edit update destroy ]

  def index
    #    @protein_seqs = ProteinSeq.all
    #
    @maxprotein_seqid = ProteinSeq.maximum(:id)

    if params[:project_id] != nil
      @data_pages = ProteinSeq.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = ProteinSeq.page params[:page]
    end
  end

    # GET /protein_seqs/1 or /protein_seqs/1.json
  def show
    @fasta_out = `ruby lib/assets/to_fasta.rb           \
                       #{@protein_seq.prot_sequence}  \
                       #{@protein_seq.proteinid}  `
  end

  # GET /protein_seqs/new
  def new
    @protein_seq = ProteinSeq.new
  end

  # GET /protein_seqs/1/edit
  def edit
  end

  # POST /protein_seqs or /protein_seqs.json
  def create
    @protein_seq = ProteinSeq.new(protein_seq_params)

    respond_to do |format|
      if @protein_seq.save
        format.html { redirect_to @protein_seq, notice: "Protein seq was successfully created." }
        format.json { render :show, status: :created, location: @protein_seq }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @protein_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protein_seqs/1 or /protein_seqs/1.json
  def update
    respond_to do |format|
      if @protein_seq.update(protein_seq_params)
        format.html { redirect_to @protein_seq, notice: "Protein seq was successfully updated." }
        format.json { render :show, status: :ok, location: @protein_seq }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @protein_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protein_seqs/1 or /protein_seqs/1.json
  def destroy
    @protein_seq.destroy
    respond_to do |format|
      format.html { redirect_to protein_seqs_url, notice: "Protein seq was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protein_seq
      @protein_seq = ProteinSeq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def protein_seq_params
      params.require(:protein_seq).permit(:project_id, :protein_id, :prot_sequence)
    end

end
