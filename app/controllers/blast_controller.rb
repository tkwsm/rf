class BlastController < ApplicationController
  protect_from_forgery

  def search
    @dbpaths = Dbpath.all
    @project_id = params[:project_id]
    @candidatedbs = Dbpath.where project_id: @project_id
    if @project_id == nil
      @candidatedb_selected = 1
    elsif @candidatedbs.to_ary[0] == nil
      @candidatedb_selected = 1
    else
      @candidatedb_selected = @candidatedbs.to_ary[0].sequence_type
    end
#    if @sample_array.to_ary[0] == nil
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
#    @dbtype1          = params[:dbtype]
    @evalue           = params[:evalue]
    @num_alignments   = params[:num_aligments]
    @num_descriptions = params[:num_descriptions]
#    @sequence_type    = params[:sequence_type]
    @seq_type         = params[:dbpath]["db_path"]
   
    @project_id       = @seq_type.split("_")[0]
    @abbreviation     = @seq_type.split("_")[1..-3].join("_")
    @dbtype           = @seq_type.split("_")[-2..-1].join("_")

    @dp_info = Dbpath.where sequence_type: @seq_type
    @dbpath  = @dp_info.to_ary[0].db_path
    # @dbpath = `ruby lib/assets/get_dbpath.rb #{@db_path} lib/assets/db.list`
   
    tmp_qseqf_path = `mktemp`
    tmp_qseqf_path.chomp!
    params[:query_seq_filename] = tmp_qseqf_path
    tmp_qseqf = File.new("#{tmp_qseqf_path}", "w+")
    @qseq     = params[:query_sequence]
    tmp_qseqf.print @qseq
    tmp_qseqf.close


#    @dbpath="/home/rf/db/GenomicDataAcquisition/oryzias_latipes_hni/Oryzias_latipes_hni.ASM223471v1.dna.toplevel.fa"
#    @dbpath="/home/rf/db/GenomicDataAcquisition/fugu_rubripes/Takifugu_rubripes.fTakRub1.2.dna.toplevel.fa"

    @blastoutput0 = ""
    @blastoutput6 = ""
    if @dbtype == "genome_scaffold"
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
                   ruby lib/assets/to_table.rb #{@project_id} #{@abbreviation}`

    elsif @dbtype == "genemodel_nucl"

      # Run for OUTFMT=0
      @blastoutput0 = `ruby lib/assets/do_blast0.rb    \
                        #{@blasttype}               \
                        #{@dbpath}                  \
                        #{tmp_qseqf_path}           \
                        #{@evalue}                  \
                        #{@num_alignments}          \
                        #{@num_descriptions}         `
      # Run for OUTFMT=6
      @blastoutput6_ary = `ruby lib/assets/do_blast6.rb  \
                        #{@blasttype}              \
                        #{@dbpath}                 \
                        #{tmp_qseqf_path}          \
                        #{@evalue}                 \
                        #{@num_alignments}         \
                        #{@num_descriptions}       \
                        #{@project_id} |           \
              ruby lib/assets/to_table_cdna.rb #{@project_id} `
      @blastoutput6 = "<table>"
      @blastoutput6_ary.split("\n").each do |blastout_unit|
        a = blastout_unit.split("\t")
        sseq_geneid = ""
        qseqid   = a[0]
        sseqid   = a[1]
        pident   = a[2]
        length   = a[3]
        mismatch = a[4]
        gapopen  = a[5]
        qstart   = a[6]
        qend     = a[7]
        sstart   = a[8]
        send     = a[9]
        evalue   = a[10]
        bitscore = a[11]
        if    sseqid =~ /^ENS\S+\.\d+$/
          sseqid = sseqid.slice(/(ENS\S+)\.\d+$/, 1)
          sseqid = "transcript:" + sseqid
        elsif sseqid =~ /^transcript:ENS\S+\.\d+$/
          sseqid = sseqid.slice(/(transcript:ENS\S+)\.\d+$/, 1)
        end
        @sseq_transcripts = Transcript.where( project_id:   @project_id, 
                                              transcriptid: "#{sseqid}")
        @blastoutput6 += "<tr><td>#{qseqid}</td>   \
                              <td>#{sseqid}</td>   \
                              <td><a href=\"http://52.199.72.224/genes/show?project_id=#{@project_id}&geneid=#{@sseq_transcripts[0].parentid}\">Gene</a>   \
                              <td>#{pident}</td>   \
                              <td>#{length}</td>   \
                              <td>#{mismatch}</td> \
                              <td>#{gapopen}</td>  \
                              <td>#{qstart}</td>   \
                              <td>#{qend}</td>     \
                              <td>#{sstart}</td>   \
                              <td>#{send}</td>     \
                              <td>#{evalue}</td>   \
                              <td>#{bitscore}</td> </tr>\n"
      end
      @blastoutput6 += "</table>"

    elsif @dbtype == "genemodel_prot"

      # Run for OUTFMT=0
      @blastoutput0 = `ruby lib/assets/do_blast0.rb    \
                        #{@blasttype}               \
                        #{@dbpath}                  \
                        #{tmp_qseqf_path}           \
                        #{@evalue}                  \
                        #{@num_alignments}          \
                        #{@num_descriptions}         `
      # Run for OUTFMT=6
      @blastoutput6_ary = `ruby lib/assets/do_blast6.rb  \
                        #{@blasttype}              \
                        #{@dbpath}                 \
                        #{tmp_qseqf_path}          \
                        #{@evalue}                 \
                        #{@num_alignments}         \
                        #{@num_descriptions}       \
                        #{@project_id} |           \
                   ruby lib/assets/to_table.rb #{@project_id} #{@abbreviation}`
    else
    end

    # post-processing
#    `rm #{tmp_qseqf_path}`
  end

end

