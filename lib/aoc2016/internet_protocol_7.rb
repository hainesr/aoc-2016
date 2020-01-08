# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class InternetProtocol7 < Day
    def setup
      @input = read_input_file.split("\n")
    end

    def part1
      num = @input.reduce(0) do |acc, line|
        acc + (supports_tls?(line) ? 1 : 0)
      end

      puts "Part 1: #{num}"
    end

    def supports_tls?(line)
      seq = ip7_sequence(line)
      seq[:hypernet].each { return false if detect_abba(_1) }
      seq[:supernet].each { return true if detect_abba(_1) }
      false
    end

    def detect_abba(str)
      (0..(str.length - 4)).each do |i|
        if str[i] == str[i + 3] &&
           str[i + 1] == str[i + 2] &&
           str[i] != str[i + 1]
          return true
        end
      end

      false
    end

    def ip7_sequence(line)
      seq = { :supernet => [], :hypernet => [] }

      line.split(/\[|\]/).each_with_index do |s, i|
        if i % 2 == 0
          seq[:supernet] << s
        else
          seq[:hypernet] << s
        end
      end

      seq
    end
  end
end
