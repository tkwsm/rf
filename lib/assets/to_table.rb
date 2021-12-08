
qseqid   = ""
sseqid   = ""
pident   = 0.0
length   = 0
mismatch = 0
gapopen  = 0
qstart   = 0
qend     = 0
sstart   = 0
send     = 0
evalue   = 0.0
bitscore = 0

project_id = ARGV.pop

output = "<table>"
ARGF.each do |x|
  a = x.chomp.split("\t")
  qseqid   = a[0]
  sseqid   = a[1]
  pident   = a[2].to_f
  length   = a[3]
  mismatch = a[4]
  gapopen  = a[5]
  qstart   = a[6]
  qend     = a[7]
  sstart   = a[8]
  send     = a[9]
  evalue   = a[10].to_f
  bitscore = a[11]
  linkurl  = "http://35.73.97.50/jbrowse/?loc=" + \
                        "#{sseqid}%3A" + \
                        "#{sstart}..#{send}&tracks=Tnigr_v1_0&highlight="

  output += "<tr><td>#{qseqid}</td>\
                 <td>#{sseqid}</td>\
                 <td>#{pident}</td>\
                 <td>#{mismatch}</td>\
                 <td>#{gapopen}</td>\
                 <td>#{qstart}</td>\
                 <td>#{qend}</td>\
                 <td>#{sstart}</td>\
                 <td>#{send}</td>\
                 <td>#{evalue}</td>\
                 <td>#{bitscore}</td>\
                 <td><a href=\"#{linkurl}\">Viewer</a></td></tr>\n"

end
output += "</table>"

print output
