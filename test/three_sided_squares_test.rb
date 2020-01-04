# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/three_sided_squares'

class AOC2016::ThreeSidedSquaresTest < Minitest::Test
  def setup
    @tss = AOC2016::ThreeSidedSquares.new
  end

  def test_possible?
    refute @tss.possible? [5, 10, 25].sort
  end
end
