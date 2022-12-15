
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

db_abbrev  = ARGV.pop
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
  linkurl = "http://52.199.72.224/galleries/viewer/#{project_id}?link=http%3A%2F%2F35.73.97.50%2Fjbrowse%2F%3Fdata%3Ddata/json/#{db_abbrev}" + "%26loc%3D#{sseqid}%3A"  + "#{sstart}..#{send}&tracks=DNA"
#              "&loc=#{sseqid}%3A"  + \
#              "#{sstart}..#{send}&tracks=DNA%2Colati_hni_v1_0&highlight="
#  linkurl = "http://52.199.72.224/galleries/viewer/4?link=http://35.73.97.50/jbrowse/?data=data/json/olati_v1_0" + \
#              "&loc=#{sseqid}%3A"  + \
#              "#{sstart}..#{send}&tracks=DNA%2Colati_hni_v1_0&highlight="

#  linkurl  = "--"

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

