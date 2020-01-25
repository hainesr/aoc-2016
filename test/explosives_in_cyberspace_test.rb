# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/explosives_in_cyberspace'

class AOC2016::ExplosivesInCyberspaceTest < Minitest::Test
  def test_decompress
    eic = AOC2016::ExplosivesInCyberspace.new

    assert_equal('ADVENT', eic.decompress('ADVENT'))
    assert_equal('ABBBBBC', eic.decompress('A(1x5)BC'))
    assert_equal('XYZXYZXYZ', eic.decompress('(3x3)XYZ'))
    assert_equal('ABCBCDEFEFG', eic.decompress('A(2x2)BCD(2x2)EFG'))
    assert_equal('(1x3)A', eic.decompress('(6x1)(1x3)A'))
    assert_equal('X(3x3)ABC(3x3)ABCY', eic.decompress('X(8x2)(3x3)ABCY'))
  end
end
