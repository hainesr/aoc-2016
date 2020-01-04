# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'digest'

require 'aoc2016'

module AOC2016
  class GameOfChess < Day
    DOOR_ID = 'ugkcyxxp'

    def setup
      @pw1, @pw2 = passwords
    end

    def part1
      puts "Part 1: #{@pw1}"
    end

    def part2
      puts "Part 2: #{@pw2}"
    end

    def passwords
      i = 700_000 # Now we know roughly where these start...
      pw1 = ''
      pw2 = ['*'] * 8

      while pw2.include?('*')
        md5 = Digest::MD5.hexdigest(DOOR_ID + i.to_s)
        if md5.start_with?('00000')
          pw1 += md5[5] if pw1.length < 8

          idx = md5[5].to_i(16)
          pw2[idx] = md5[6] if idx < 8 && pw2[idx] == '*'
        end

        i += 1
      end

      [pw1, pw2.join]
    end
  end
end
