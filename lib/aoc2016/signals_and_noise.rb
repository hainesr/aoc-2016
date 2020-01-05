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
      @p2, @p1 = decode(read_input_file.split("\n"))
    end

    def part1
      puts "Part 1: #{@p1}"
    end

    def part2
      puts "Part 2: #{@p2}"
    end

    def decode(message)
      message.map(&:chars).transpose.map do |line|
        line.group_by { _1 }
      end.map(&:values).map do |v|
        v.minmax { |a, b| a.length <=> b.length }
      end.map { _1.map(&:uniq) }.transpose.map(&:join)
    end
  end
end
