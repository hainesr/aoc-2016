# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class BathroomSecurity < Day
    KEYPAD1 = [
      nil, nil, nil, nil, nil,
      nil, 1, 2, 3, nil,
      nil, 4, 5, 6, nil,
      nil, 7, 8, 9, nil,
      nil, nil, nil, nil, nil
    ].freeze

    def run
      puts "Part 1: #{get_code(KEYPAD1, read_input_file, 12)}"
    end

    def get_code(keypad, steps, pos)
      code = []

      steps.split("\n").each do |line|
        line.chars.each do |c|
          case c
          when 'U'
            pos -= 5 unless keypad[pos - 5].nil?
          when 'D'
            pos += 5 unless keypad[pos + 5].nil?
          when 'L'
            pos -= 1 unless keypad[pos - 1].nil?
          when 'R'
            pos += 1 unless keypad[pos + 1].nil?
          end
        end
        code << keypad[pos]
      end

      code.join
    end
  end
end
