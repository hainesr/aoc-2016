# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class ExplosivesInCyberspace < Day
    def setup
      @input = read_input_file
    end

    def part1
      puts "Part 1: #{decompress(@input).length}"
    end

    def decompress(input)
      output = ''
      i = 0

      while i < input.length
        j = input.index('(', i)
        return output + input[i..-1] if j.nil?

        k = input.index(')', j)
        x, y = input[(j + 1)...k].split('x').map(&:to_i)
        k += 1
        r = input[k...(k + x)]
        output += input[i...j]
        output += r * y

        i = k + x
      end

      output
    end
  end
end
