# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/security_through_obscurity'

class AOC2016::SecurityThroughObscurityTest < Minitest::Test
  ROOM1 = 'aaaaa-bbb-z-y-x-123[abxyz]'
  ROOM2 = 'a-b-c-d-e-f-g-h-987[abcde]'
  ROOM3 = 'not-a-real-room-404[oarel]'
  ROOM4 = 'totally-real-room-200[decoy]'

  def setup
    @sto = AOC2016::SecurityThroughObscurity.new
  end

  def test_decrypt_room
    assert_equal(
      ['very encrypted name', 343],
      @sto.decrypt_room('qzmt-zixmtkozy-ivhz-343[check]')
    )
  end

  def _test_sum_real_rooms
    assert_equal(
      1514,
      @sto.sum_real_rooms([ROOM1, ROOM2, ROOM3, ROOM4])
    )
  end

  def test_checksum
    assert_equal('abxyz', @sto.checksum('aaaaabbbzyx'))
    assert_equal('oarel', @sto.checksum('notarealroom'))
  end

  def test_name_components
    assert_equal(
      ['aaaaa-bbb-z-y-x', 123, 'abxyz'],
      @sto.name_components(ROOM1)
    )

    assert_equal(
      ['a-b-c-d-e-f-g-h', 987, 'abcde'],
      @sto.name_components(ROOM2)
    )

    assert_equal(
      ['not-a-real-room', 404, 'oarel'],
      @sto.name_components(ROOM3)
    )

    assert_equal(
      ['totally-real-room', 200, 'decoy'],
      @sto.name_components(ROOM4)
    )
  end
end
