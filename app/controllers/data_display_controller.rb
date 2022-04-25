class DataDisplayController < ApplicationController


   def start_ids
    @maxid_genes = 0
    @maxid_attributes = 0
    @maxid_transcripts = 0
    @maxid_tattributes = 0
    @maxid_transc_seqs = 0

    @maxid_genes       = Gene.maximum(:id)
    @maxid_attributes  = Attribute.maximum(:id)
    @maxid_tattributes = Tattribute.maximum(:id)
    @maxid_transcripts = Transcript.maximum(:id)
    @maxid_transc_seqs = TranscriptSeq.maximum(:id)
  end

end
