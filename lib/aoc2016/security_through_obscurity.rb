# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'aoc2016'

module AOC2016
  class SecurityThroughObscurity < Day
    LETTERS = ('a'..'z').to_a

    def setup
      @input = read_input_file.split("\n")
    end

    def part1
      puts "Part 1: #{sum_real_rooms(@input)}"
    end

    def part2
      @input.each do |room|
        name, id = decrypt_room(room)
        if name.include?('north')
          puts "Part 2: #{id} (#{name})"
          break
        end
      end
    end

    def sum_real_rooms(rooms)
      rooms.map do |room|
        letters, id, check = name_components(room)
        check == checksum(letters) ? id : 0
      end.sum
    end

    def decrypt_room(enc_name)
      name, id, = name_components(enc_name)
      code = LETTERS.rotate(id % 26)
      [name.tr(LETTERS.join + '-', code.join + ' '), id]
    end

    def checksum(letters)
      temp = letters.tr('-', '').chars.group_by do
        letters.count(_1)
      end.transform_values { _1.uniq.sort }

      temp.keys.sort.reverse.reduce([]) { |acc, i| acc + temp[i] }.join[0...5]
    end

    def name_components(enc_name)
      name, checksum = enc_name.split('[')

      [name[0...-4], name[-3..-1].to_i, checksum.chop]
    end
  end
end
