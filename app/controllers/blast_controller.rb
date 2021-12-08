class BlastController < ApplicationController
  protect_from_forgery

  def search
    @dbpaths = Dbpath.all
#    @sample_array = Dbpath.where "abbreviation like ?", "char"
#    @sample_array = @sample_array.to_ary[0].project_id
#    if @sample_array.to_ary[0] == nil
#      @project_id   = @sample_array.to_ary[0].project_id
#      @project_id   = 1
#    else
#      @project_id   = @sample_array.to_ary[0].project_id
#    end
#    @sample_array = @sample_array.select("db_path")
#    @sample_array = @sample_array.to_ary.collect{|x| x.db_path.split("/")[-1]}
  end

  def blastout
    # prepare sequence

    @blasttype        = params[:blasttype]
    @evalue           = params[:evalue]
    @num_alignments   = params[:num_aligments]
    @num_descriptions = params[:num_descriptions]
    @sequence_type    = params[:sequence_type]
    @db_path          = params[:dbpath]["db_path"]
    @project_id       = @db_path.split("_")[0]
    @abbreviation     = @db_path.split("_")[1]
    @dbtype           = @db_path.split("_")[2..-1].join("_")
   
    tmp_qseqf_path = `mktemp`
    tmp_qseqf_path.chomp!
    params[:query_seq_filename] = tmp_qseqf_path
    tmp_qseqf = File.new("#{tmp_qseqf_path}", "w+")
    @qseq     = params[:query_sequence]
    tmp_qseqf.print @qseq
    tmp_qseqf.close
    @tmpfilepath = tmp_qseqf_path

    @dbpath = `ruby lib/assets/get_dbpath.rb #{@db_path} lib/assets/db.list`
#    @dbpath="/Users/tkdtmac1/study/db/takifugu_rubripes/Takifugu_rubripes.fTakRub1.2.dna.toplevel.fa"

    # Run for OUTFMT=0
    @blastoutput0 = `ruby lib/assets/do_blast0.rb    \
                        #{@blasttype}               \
                        #{@dbpath}                  \
                        #{tmp_qseqf_path}           \
                        #{@evalue}                  \
                        #{@num_alignments}          \
                        #{@num_descriptions}         `

    # Run for OUTFMT=6
    @blastoutput6 = `ruby lib/assets/do_blast6.rb  \
                        #{@blasttype}              \
                        #{@dbpath}                 \
                        #{tmp_qseqf_path}          \
                        #{@evalue}                 \
                        #{@num_alignments}         \
                        #{@num_descriptions}       \
                        #{@project_id} |           \
                     ruby lib/assets/to_table.rb    `

    # post-processing
    `rm #{tmp_qseqf_path}`
  end

end

