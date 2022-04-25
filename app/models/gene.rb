class Gene < ApplicationRecord

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



  private

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


end
