
blastdirpath="/Users/tkdtmac1/src/ncbiblast/ncbi-blast-2.11.0+/bin"
blasttype        = ARGV[0]
db               = ARGV[1]
queryseq         = ARGV[2]
evalue           = ARGV[3].to_f
num_alignments   = ARGV[4].to_i
num_descriptions = ARGV[5].to_i

# p [db, queryseq, evalue, num_alignments, num_descriptions ]

output = `#{blastdirpath}/#{blasttype}                       \
                       -outfmt            6                  \
                       -db                #{db}              \
                       -query             #{queryseq}        \
                       -evalue            #{evalue}          \
                       -num_alignments    #{num_alignments}  \ 
                       -num_descriptions  #{num_descriptions}  `

output2 = ""
output2 += "<p>"
output.split("\n").each do |y|
  output2 += y
  output2 += "<br>\n"
end
output2 += "</p>"
 
# print output2
print output


