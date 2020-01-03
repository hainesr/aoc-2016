# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/bathroom_security'

class AOC2016::BathroomSecurityTest < Minitest::Test
  CODE1 = <<~EOC1
    ULL
    RRDDD
    LURDL
    UUUUD
  EOC1

  def setup
    @bs = AOC2016::BathroomSecurity.new
  end

  def test_get_code
    assert_equal(
      '1985',
      @bs.get_code(AOC2016::BathroomSecurity::KEYPAD1, CODE1, 12)
    )

    assert_equal(
      '5DB3',
      @bs.get_code(AOC2016::BathroomSecurity::KEYPAD2, CODE1, 15)
    )
  end
end
