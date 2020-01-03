# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'rubygems'
require 'bundler/setup'

require 'aoc2016/day'

module AOC2016
  INPUT_DIR = ::File.expand_path('../etc', __dir__)

  DAY_MAP = [
    nil
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2016::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
