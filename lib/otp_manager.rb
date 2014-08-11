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
        YAML.load_file(file)
    end

    def write(otp, file)
        if(File.exists?(file))
            @otps = self.load(file)
        end
        @otps << otp
        File.open(file, 'w') do |f|
            f.puts YAML.dump(@otps)
        end
    end

end
