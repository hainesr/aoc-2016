# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class Taxicab < Day
    def run
      input = read_input_file.split(', ')
      path = generate_path(input)

      puts "Part 1: #{shortest_path(path)}"
    end

    def shortest_path(path)
      path[-1].split(',').map(&:to_i).map(&:abs).sum
    end

    def generate_path(input)
      facing = [:n, :e, :s, :w]
      x = 0
      y = 0

      input.each_with_object([]) do |step, path|
        step[0] == 'R' ? facing.rotate!(1) : facing.rotate!(-1)
        mag = step[1..-1].to_i

        mag.times do
          case facing[0]
          when :n
            y += 1
          when :s
            y -= 1
          when :e
            x += 1
          when :w
            x -= 1
          end

          path << "#{x},#{y}"
        end
      end
    end
  end
end
