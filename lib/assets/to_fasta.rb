

defline = ARGV.pop
seqline = ARGV.pop

output = ">#{defline}\n"
seqline.split("").each_with_index do |nuc, i|
  if (i+1) % 100 == 0
    output += "#{nuc}\n"
  else
    output += "#{nuc}"
  end
end
output += "\n"

print output

