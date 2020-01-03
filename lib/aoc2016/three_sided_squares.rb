# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class ThreeSidedSquares < Day
    def run
      input = read_input_file.split("\n").map { _1.split.map(&:to_i) }

      puts "Part 1: #{how_many_possible(input)}"
    end

    def how_many_possible(list)
      list.count { possible? _1 }
    end

    def possible?(triangle)
      triangle.sort!
      triangle[0] + triangle[1] > triangle[2]
    end
  end
end
