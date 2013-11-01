#!/usr/bin/env ruby
#
#

# print encoding table
puts "Straddling Checkerboard"
puts "AT-ONE-SIR version"
puts
print <<EOF
 | 0 1 2 3 4 5 6 7 8 9
 +---------------------
 | A T   O N E   S I R
2| B C D F G H J K L M
6| P Q U V W X Y Z . fig
EOF

puts

otp = ""
prng = Random.new
500.times do
	otp << prng.rand(0..10).to_s
end
groups = otp.scan(/.{1,5}/)
i = 0
j = 5
while(groups[j] != nil) do
	puts groups[i..j].join(' ')
	i += 5
	j += 5
end
