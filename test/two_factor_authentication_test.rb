# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/two_factor_authentication'

class AOC2016::TwoFactorAuthenticationTest < Minitest::Test
  def test_screen
    screen = AOC2016::TwoFactorAuthentication::Screen.new(7, 3)
    assert_equal(
      [
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ']
      ],
      screen.pixels
    )

    screen.rect(3, 2)
    assert_equal(
      [
        ['#', '#', '#', ' ', ' ', ' ', ' '],
        ['#', '#', '#', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ']
      ],
      screen.pixels
    )

    screen.rotate_column(1, 1)
    assert_equal(
      [
        ['#', ' ', '#', ' ', ' ', ' ', ' '],
        ['#', '#', '#', ' ', ' ', ' ', ' '],
        [' ', '#', ' ', ' ', ' ', ' ', ' ']
      ],
      screen.pixels
    )

    screen.rotate_row(0, 4)
    assert_equal(
      [
        [' ', ' ', ' ', ' ', '#', ' ', '#'],
        ['#', '#', '#', ' ', ' ', ' ', ' '],
        [' ', '#', ' ', ' ', ' ', ' ', ' ']
      ],
      screen.pixels
    )

    screen.rotate_column(1, 1)
    assert_equal(
      [
        [' ', '#', ' ', ' ', '#', ' ', '#'],
        ['#', ' ', '#', ' ', ' ', ' ', ' '],
        [' ', '#', ' ', ' ', ' ', ' ', ' ']
      ],
      screen.pixels
    )

    assert_equal(6, screen.count)
  end
end
