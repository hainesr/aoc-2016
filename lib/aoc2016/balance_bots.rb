# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class BalanceBots < Day
    def setup
      input = read_input_file.split("\n")
      bots = []
      rules = {}

      input.each do |line|
        tokens = line.split

        if tokens[0] == 'value'
          bot = tokens[5].to_i
          bots[bot] ||= []
          bots[bot] << tokens[1].to_i
        else
          bot = tokens[1].to_i
          rules[bot] = [
            [tokens[5].to_sym, tokens[6].to_i],
            [tokens[10].to_sym, tokens[11].to_i]
          ]
        end
      end

      @p1, @p2 = apply_rules(bots, rules)
    end

    def part1
      puts "Part 1: #{@p1}"
    end

    def part2
      puts "Part 2: #{@p2}"
    end

    def apply_rules(bots, rules)
      outputs = Array.new(3, 0)
      part_1 = 0
      part_2 = 0

      while part_1.zero? || part_2.zero?
        bots.each_with_index do |values, bot|
          next if values.nil? || values.length != 2

          ((low_type, low_dest), (high_type, high_dest)) = rules[bot]
          low, high = values.sort
          part_1 = bot if low == 17 && high == 61

          if low_type == :bot
            bots[low_dest] ||= []
            bots[low_dest] << low
          else
            outputs[low_dest] = low
          end

          if high_type == :bot
            bots[high_dest] ||= []
            bots[high_dest] << high
          else
            outputs[high_dest] = high
          end

          bots[bot] = []
          part_2 = outputs[0..2].reduce(1) { _2 * _1 }
        end
      end

      [part_1, part_2]
    end
  end
end
