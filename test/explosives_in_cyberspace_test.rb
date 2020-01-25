# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/explosives_in_cyberspace'

class AOC2016::ExplosivesInCyberspaceTest < Minitest::Test
  def setup
    @eic = AOC2016::ExplosivesInCyberspace.new
  end

  def test_decompress
    assert_equal('ADVENT', @eic.decompress('ADVENT'))
    assert_equal('ABBBBBC', @eic.decompress('A(1x5)BC'))
    assert_equal('XYZXYZXYZ', @eic.decompress('(3x3)XYZ'))
    assert_equal('ABCBCDEFEFG', @eic.decompress('A(2x2)BCD(2x2)EFG'))
    assert_equal('(1x3)A', @eic.decompress('(6x1)(1x3)A'))
    assert_equal('X(3x3)ABC(3x3)ABCY', @eic.decompress('X(8x2)(3x3)ABCY'))
  end

  def test_decompressed_length
    assert_equal(6, @eic.decompressed_length('ADVENT'))
    assert_equal(7, @eic.decompressed_length('A(1x5)BC'))
    assert_equal(9, @eic.decompressed_length('(3x3)XYZ'))
    assert_equal(20, @eic.decompressed_length('X(8x2)(3x3)ABCY'))
    assert_equal(
      241_920,
      @eic.decompressed_length('(27x12)(20x12)(13x14)(7x10)(1x12)A')
    )
    assert_equal(
      445, @eic.decompressed_length(
        '(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN'
        )
      )
  end
end
