
selected_dbid = ARGV.shift

h = {}
ARGF.each do |x|
  next if x !~ /\S/
  a = x.chomp.split("\t")
  dbid   = a[0]
  dbpath = a[1].chomp
  h[ dbid ] = dbpath
end

print "#{h[ selected_dbid ]}"
