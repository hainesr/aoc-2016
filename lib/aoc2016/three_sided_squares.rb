# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class ThreeSidedSquares < Day
    def setup
      @input = read_input_file.split("\n").map { _1.split.map(&:to_i) }
    end

    def part1
      puts "Part 1: #{how_many_possible(@input)}"
    end

    def part2
      puts "Part 2: #{how_many_possible(@input, true)}"
    end

    def how_many_possible(list, transpose = false)
      return list.count { possible? _1.sort } unless transpose

      list.each_slice(3).flat_map do |a, b, c|
        a.zip b, c
      end.count { possible? _1.sort }
    end

    def possible?(triangle)
      triangle[0] + triangle[1] > triangle[2]
    end
  end
end
