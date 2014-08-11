#!/usr/bin/env ruby
#
#

require 'securerandom'

class Otp
    attr_reader :id, :pad

    def initialize
        @id = SecureRandom.uuid
        @pad = []
        500.times do
            @pad << SecureRandom.random_number(10)
        end
    end

    def print
        # print encoding table
        puts
        puts "Straddling Checkerboard"
        puts "AT-ONE-SIR encoding"
        puts

        puts " | 0 1 2 3 4 5 6 7 8 9"
        puts " +---------------------"
        puts " | A T   O N E   S I R"
        puts "2| B C D F G H J K L M"
        puts "6| P Q U V W X Y Z . fig"
        puts
        puts "ID: " + @id
        puts

        numbers = @pad.join('')
        groups = numbers.scan(/.{1,5}/)
        i = 0
        j = 5
        while(groups[j] != nil) do
	        puts groups[i..j].join(' ')
	        i += 5
	        j += 5
        end
    end

end
