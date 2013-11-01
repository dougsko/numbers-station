#!/usr/bin/env ruby
#
#
# Implements AT-ONE-SIR encoding

class NumbersStation
	def initialize
		@letters = {'A' => '0',
					'B' => '20',
					'C' => '21',
					'D' => '22',
					'E' => '5',
					'F' => '23',
					'G' => '24',
					'H' => '25',
					'I' => '8',
					'J' => '26',
					'K' => '27',
					'L' => '28',
					'M' => '29',
					'N' => '4',
					'O' => '3',
					'P' => '60',
					'Q' => '61',
					'R' => '9',
					'S' => '7',
					'T' => '1',
					'U' => '62',
					'V' => '63',
					'W' => '64',
					'X' => '65',
					'Y' => '66',
					'Z' => '67',
					'.' => '68',
					'fig' => '69'
				}
		@numbers = @letters.invert
		@numbers['69'] = ' '

	end

	def preprocess(input)
		input = input.gsub(/[^\w\.]/, '')
		input = input.gsub(/(\d)/, "\\1\\1\\1")
		input = input.gsub(/(\d{3}+)/, "69\\169")
		input.upcase
	end

	def encode(input)
		encoded = ''
		processed = preprocess(input)
		processed.split('').each do |letter|
			if @letters[letter]
				encoded << @letters[letter]
			else
				encoded << letter
			end
		end
		encoded
	end

	def decode(input)
		numbers = input.split('')
		res = []
		decoded = ''
		i = 0
		0.upto(numbers.size) do
			break if i >= numbers.size
			if numbers[i] == '2'
				decoded << @numbers[numbers[i..i+1].join('')]
				i += 2
			elsif numbers[i] == '6' and numbers[i+1] != '9'
				decoded << @numbers[numbers[i..i+1].join('')]
				i += 2
			elsif numbers[i] == '6' and numbers[i+1] == '9'
				i += 2
				j = i
				until numbers[j] == '6' and numbers[j+1] == '9'
					decoded << numbers[j]
					j += 3
					i = j + 1
				end
				i += 1
			else
				decoded << @numbers[numbers[i]]
				i += 1
			end
		end
		decoded
	end

	def encrypt(encoded, key)
		(encoded - key) % 10
	end

	def decrypt(ciphertext, key)
		(ciphertext + key) % 10
	end

	private :preprocess
end

