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

    def part1
      puts "Part 1: #{password}"
    end

    def password
      i = 700_000 # Now we know roughly where these start...
      password = ''

      until password.length == 8
        md5 = Digest::MD5.hexdigest(DOOR_ID + i.to_s)
        password += md5[5] if md5.start_with?('00000')

        i += 1
      end

      password
    end
  end
end
