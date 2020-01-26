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
      @bots = []
      @rules = {}

      input.each do |line|
        tokens = line.split

        if tokens[0] == 'value'
          bot = tokens[5].to_i
          @bots[bot] ||= []
          @bots[bot] << tokens[1].to_i
        else
          bot = tokens[1].to_i
          @rules[bot] = [
            [tokens[5].to_sym, tokens[6].to_i],
            [tokens[10].to_sym, tokens[11].to_i]
          ]
        end
      end
    end

    def part1
      found = 0

      while found.zero?
        @bots.each_with_index do |values, bot|
          next if values.nil? || values.length != 2

          ((low_type, low_dest), (high_type, high_dest)) = @rules[bot]
          low, high = values.sort
          if low == 17 && high == 61
            found = bot
            break
          end

          if low_type == :bot
            @bots[low_dest] ||= []
            @bots[low_dest] << low
          end

          if high_type == :bot
            @bots[high_dest] ||= []
            @bots[high_dest] << high
          end

          @bots[bot] = []
        end
      end

      puts "Part 1: #{found}"
    end
  end
end
