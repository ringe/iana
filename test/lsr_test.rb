#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../lib/iana'

class TestLanguageSubtagRegistry < Test::Unit::TestCase

  Datafile = File.dirname(__FILE__) + '/../example-data/lsr.txt'

  def setup
    @LSR = IANA::LanguageSubtagRegistry
  end

  def teardown
  end

  ################################################
  # Tests run in alphabetical order, apparently.

  def test_a_open
    assert_nothing_raised { @LSR::open(Datafile) }
    test_loaded
  end

  def test_b_get
    assert_nothing_raised { @LSR::get }
    test_loaded
  end

  def test_c_dump
    #@LSR::open(Datafile)
    text = ""
    assert_nothing_raised { text = @LSR::dump }
    test_dump_format(text)
    ['iana', 'yaml'].each do |arg_valid|
      assert_nothing_raised { text = @LSR::dump(arg_valid) }
      test_dump_format(text)
    end
    assert_nothing_raised { text = @LSR::dump('hash') }
    test_dump_format(text, Hash)
    assert_raise(ArgumentError) { text = @LSR::dump('abcd') }
    assert_raise(ArgumentError) { text = @LSR::dump(5) }
  end

  ################################################

  private

  def test_dump_format(text, cls=String)
    assert_kind_of(cls, text)
    assert_not_equal(cls.new, text)
  end

  def test_loaded
    assert_kind_of(String, @LSR::file_date)
    assert_kind_of(Array, @LSR::tags)
  end

end

