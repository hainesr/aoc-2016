# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/signals_and_noise'

class AOC2016::SignalsAndNoiseTest < Minitest::Test
  MESSAGE = <<~EOM.split("\n")
    eedadn
    drvtee
    eandsr
    raavrd
    atevrs
    tsrnev
    sdttsa
    rasrtv
    nssdts
    ntnada
    svetve
    tesnvt
    vntsnd
    vrdear
    dvrsen
    enarar
  EOM

  def setup
    @san = AOC2016::SignalsAndNoise.new
  end

  def test_decode
    assert_equal('easter', @san.decode(MESSAGE))
  end
end
