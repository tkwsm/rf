

def to_table_cdna( project_id, afile )

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

  output = "#{project_id} test"

  output2 = ""
  afile.each do |x|
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

    output2 += [qseqid, sseqid, pident, length, mismatch, gapopen, qstart, qend, sstart, send, evalue, bitscore].join("\t") + "\n"

  end

  return output2

end

project_id = ARGV.pop
print to_table_cdna( project_id, ARGF )

