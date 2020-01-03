# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

module AOC2016
  class Day
    def run
      puts "This day's puzzle hasn't been solved yet."
    end

    private

    def read_input_file
      ::File.read(input_file).chomp
    end

    def input_file
      file = "#{class_snake_case}.txt"
      ::File.join(INPUT_DIR, file)
    end

    def class_snake_case
      ::File.basename(method(:run).source_location[0]).split('.')[0]
    end
  end
end
