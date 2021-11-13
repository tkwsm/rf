
selected_dbid = ARGV.shift

h = {}
ARGF.each do |x|
  a = x.chomp.split("\t")
  dbid   = a[0]
  dbpath = a[1]
  h[ dbid ] = dbpath
end

print "#{h[ selected_dbid ]}"
