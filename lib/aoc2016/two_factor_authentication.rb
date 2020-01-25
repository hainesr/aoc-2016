# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class TwoFactorAuthentication < Day
    def setup
      @input = read_input_file.split("\n")
    end

    def part1
      screen = Screen.new(50, 6)

      @input.each do |line|
        tokens = line.split

        if tokens[0] == 'rect'
          x, y = tokens[1].split('x')
          screen.rect(x.to_i, y.to_i)
        else
          _, n = tokens[2].split('=')
          if tokens[1] == 'column'
            screen.rotate_column(n.to_i, tokens[4].to_i)
          else
            screen.rotate_row(n.to_i, tokens[4].to_i)
          end
        end
      end

      puts "Part 1: #{screen.count}"
    end

    class Screen
      attr_reader :pixels

      def initialize(x, y)
        @pixels = Array.new(y) { Array.new(x, ' ') }
      end

      def rect(x, y)
        y.times do |i|
          x.times do |j|
            @pixels[i][j] = '#'
          end
        end
      end

      def rotate_column(x, c)
        tmp = @pixels.transpose
        tmp[x].rotate!(-c)
        @pixels = tmp.transpose
      end

      def rotate_row(y, c)
        @pixels[y].rotate!(-c)
      end

      def count
        @pixels.flatten.count('#')
      end
    end
  end
end
