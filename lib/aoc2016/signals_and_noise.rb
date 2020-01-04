# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class SignalsAndNoise < Day
    def setup
      @message = read_input_file.split("\n")
    end

    def part1
      puts "Part 1: #{decode(@message)}"
    end

    def decode(message)
      message.map(&:chars).transpose.map do |line|
        line.group_by { _1 }
      end.map(&:values).map do |v|
        v.max { |a, b| a.length <=> b.length }
      end.map(&:uniq).join
    end
  end
end
