class GenesController < ApplicationController

  def index
    @msg  = 'Genes data.'
    @maxgid = 0
    if params[:project_id] != nil
      @data_pages = Gene.where(" project_id = ? ", params[:project_id] ).page params[:page]
    else
      @data_pages = Gene.page params[:page]
    end
    @maxgid = Gene.maximum(:id)
  end

  def show
    @msg  = 'Gene model detalis'
    ## $ipaddress_d4rf_rails3
    ## $ipaddress_d4rf_jbrowse3

    @geneid = ""
    @project_id = 0
    if    params[:geneid] and params[:project_id]
      @geneid     = params[:geneid]
      @project_id = params[:project_id]
      @data = Gene.find_by( project_id: @project_id, geneid: @geneid )
    else
      @data = Gene.find(params[:id])
    end

    @gattrdata4geneid = []
    if @data == nil
      if  params[:project_id]
        @project_id = params[:project_id]
        @gattrdata4geneid = Attribute.where(" project_id = ? and gtag = ? and gvalue = ? ", @project_id, "Name", @geneid ).first
        if @gattrdata4geneid != nil 
          @geneid = @gattrdata4geneid.geneid
          @data = Gene.find_by( geneid: @geneid )
        elsif @geneid =~ /^\S+-\d+$/
          @geneid = @geneid.slice(/^(\S+)-\d+$/, 1 )
          @data = Gene.find_by( geneid: @geneid )
        else
          @data = []
        end
       else
         @gattrdata4geneid = Attribute.where(" gtag = ? and gvalue = ? ", "Name", @geneid ).first
        @geneid = ""
        @data =   []
       end
    end

    @gattrdata = []

    if @data
      @project_id = @data.project_id
      @gattrdata  = Attribute.where(" geneid = ? ", @data.geneid )
    else
    end

    @gurl = "http://" + "#{$ipaddress_d4rf_rails3}" + "/genes/show?geneid="
    @tdata     = []
    @tattrdata = []
    @tseqdata  = []
    @pdata     = []
    @pseqdata  = []
    if @data
      obj = Transcript.find_by( parentid: @data.geneid )
      catalog = Gallery.find_by( id: @project_id )
      @burl = catalog.url_link
      @burl_ant = @burl.slice(/^(\S+)\/jbrowse/, 1)
      @burl_pos = @burl.slice(/^\S+jbrowse\S+data=(\S+)/, 1)

      @transcriptid = obj.transcriptid
      @tdata = Transcript.where(" parentid = ? ", @data.geneid )
      @tattrdata = Tattribute.where(" transcriptid = ? ", @transcriptid )
      @tseqdata  = TranscriptSeq.where(" project_id = ? and transcript_id = ?",
                                         @project_id, @transcriptid )
      if @tseqdata == nil or @tseqdata == []
        @transcriptid = "transcript:#{@transcriptid}"
        @tseqdata = TranscriptSeq.where(" project_id = ? and transcript_id = ?",
                                         @project_id, @transcriptid )
      end

      @tdata.each do |t|
        @pdata << Protein.where(" parentid = ? ", t.transcriptid )
      end
      @pdata.each do |pdat|
        pdat.each do |p|
          @pseqdata = ProteinSeq.where(" project_id = ? and proteinid = ?",
                                         @project_id, p.proteinid )
        end
      end

      @aurl="#{@burl_ant}/jbrowse?loc=#{@data.seqid}%3A#{@data.gstart}..#{@data.gend}%26data=#{@burl_pos}"
    else
      @aurl=@burl
    end
    @iframe_aurl="http://" + "#{$ipaddress_d4rf_rails3}" "/galleries/viewer/#{@project_id}?link=#{@aurl}"
  end

  def gene_find
    @msg  = 'Find Gene by GeneID.'
    @genes = Array.new
    if request.post? 
      @genes = Gene.where( geneid: params[:geneid] )
    end
  end

  def other
  end

  def to_fasta( seqid, sequence, num )
    output  = ""
    output += ">#{seqid}\n"
    sequence.split("").each_with_index do |n, i|
      if (i + 1) % num == 0
        output += "#{n}\n"
      else
        output += "#{n}"
      end
    end
    return output
  end


  helper_method :to_fasta

end
