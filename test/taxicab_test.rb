# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/taxicab'

class AOC2016::TaxicabTest < Minitest::Test
  DIR1 = ['R2', 'L3'].freeze
  DIR2 = ['R2', 'R2', 'R2'].freeze
  DIR3 = ['R5', 'L5', 'R5', 'R3'].freeze

  def setup
    @t = AOC2016::Taxicab.new
  end

  def test_generate_path
    assert_equal(
      ['1,0', '2,0', '2,1', '2,2', '2,3'],
      @t.generate_path(DIR1)
    )
  end

  def test_shortest_path
    assert_equal(5, @t.shortest_path(@t.generate_path(DIR1)))
    assert_equal(2, @t.shortest_path(@t.generate_path(DIR2)))
    assert_equal(12, @t.shortest_path(@t.generate_path(DIR3)))
  end
end
