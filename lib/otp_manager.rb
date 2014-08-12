#!/usr/bin/env ruby
#
#

#require './otp'
require 'yaml'

class OTPManager
    attr_reader :otps

    def initialize
        @otps = []
    end

    def load(file)
        if(File.exists?(file))
            YAML.load_file(file)
        end
    end

    def write(my_otp, file)
        updated = false
        if(File.exists?(file))
            @otps = self.load(file)
        end
        @otps.each_with_index do |otp, i|
            if(otp.id == my_otp.id)
                @otps[i] = my_otp
                updated = true
            end
        end
        if(updated == false)
            puts "new otp"
            @otps << my_otp
        end
        File.open(file, 'w') do |f|
            f.puts YAML.dump(@otps)
        end
    end

end
