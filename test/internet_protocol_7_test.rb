# frozen_string_literal: true

# Advent of Code 2016
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2016/internet_protocol_7'

class AOC2016::InternetProtocol7Test < Minitest::Test
  IP1 = 'abba[mnop]qrst'
  IP2 = 'abcd[bddb]xyyx'
  IP3 = 'aaaa[qwer]tyui'
  IP4 = 'ioxxoj[asdfgh]zxcvbn'
  IP5 = 'aba[bab]xyz'
  IP6 = 'xyx[xyx]xyx'
  IP7 = 'aaa[kek]eke'
  IP8 = 'zazbz[bzb]cdb'

  def setup
    @ip7 = AOC2016::InternetProtocol7.new
  end

  def test_supports_tls
    assert @ip7.supports_tls?(IP1)
    refute @ip7.supports_tls?(IP2)
    refute @ip7.supports_tls?(IP3)
    assert @ip7.supports_tls?(IP4)
  end

  def test_supports_ssl
    assert @ip7.supports_ssl?(IP5)
    refute @ip7.supports_ssl?(IP6)
    assert @ip7.supports_ssl?(IP7)
    assert @ip7.supports_ssl?(IP8)
  end

  def test_detect_abba
    assert @ip7.detect_abba('abba')
    assert @ip7.detect_abba('abxyyxab')
    assert @ip7.detect_abba('ababxyyx')
    assert @ip7.detect_abba('xyyxaaaa')
    refute @ip7.detect_abba('aaaa')
    refute @ip7.detect_abba('abab')
  end

  def test_detect_aba
    assert_equal([['a', 'b']], @ip7.detect_aba('aba'))
    assert_equal([['b', 'a']], @ip7.detect_aba('bab'))
    assert_equal([['b', 'a'], ['x', 'y']], @ip7.detect_aba('babbbzzzxxxyx'))
    assert_equal([], @ip7.detect_aba('aaa'))
    assert @ip7.detect_aba('bvgdcxyxxades', 'x', 'y')
    refute @ip7.detect_aba('hgbdxyxjhnfda', 'y', 'x')
  end

  def test_ip7_sequence
    assert_equal(
      { :supernet => ['abba', 'qrst'], :hypernet => ['mnop'] },
      @ip7.ip7_sequence(IP1)
    )
    assert_equal(
      { :supernet => ['ioxxoj', 'zxcvbn'], :hypernet => ['asdfgh'] },
      @ip7.ip7_sequence(IP4)
    )
  end
end
