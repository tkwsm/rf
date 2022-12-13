class TranscriptSeqsController < ApplicationController
  before_action :set_transcript_seq, only: %i[ show edit update destroy ]

  # GET /transcript_seqs or /transcript_seqs.json
  def index
#    @transcript_seqs = TranscriptSeq.all
    #
    @maxtransc_seqid = TranscriptSeq.maximum(:id)

    if params[:project_id] != nil
      @data_pages = TranscriptSeq.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = TranscriptSeq.page params[:page]
    end
  end

  # GET /transcript_seqs/1 or /transcript_seqs/1.json
  def show
    @fasta_out = `ruby lib/assets/to_fasta.rb           \
                       #{@transcript_seq.nuc_sequence}  \
                       #{@transcript_seq.transcript_id}  `
  end

  # GET /transcript_seqs/new
  def new
    @transcript_seq = TranscriptSeq.new
  end

  # GET /transcript_seqs/1/edit
  def edit
  end

  # POST /transcript_seqs or /transcript_seqs.json
  def create
    @transcript_seq = TranscriptSeq.new(transcript_seq_params)

    respond_to do |format|
      if @transcript_seq.save
        format.html { redirect_to @transcript_seq, notice: "Transcript seq was successfully created." }
        format.json { render :show, status: :created, location: @transcript_seq }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transcript_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcript_seqs/1 or /transcript_seqs/1.json
  def update
    respond_to do |format|
      if @transcript_seq.update(transcript_seq_params)
        format.html { redirect_to @transcript_seq, notice: "Transcript seq was successfully updated." }
        format.json { render :show, status: :ok, location: @transcript_seq }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transcript_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcript_seqs/1 or /transcript_seqs/1.json
  def destroy
    @transcript_seq.destroy
    respond_to do |format|
      format.html { redirect_to transcript_seqs_url, notice: "Transcript seq was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcript_seq
      @transcript_seq = TranscriptSeq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transcript_seq_params
      params.require(:transcript_seq).permit(:project_id, :transcript_id, :nuc_sequence)
    end
end
