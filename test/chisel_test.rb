require "minitest/autorun"
require "minitest/pride"
require "../lib/chisel"

class ChiselTest < Minitest::Test


  def test_can_take_a_string_for_input
    skip
    chisel = Chisel.new("")


  end

  def test_can_convert_a_simple_string
    chisel = Chisel.new("#hello")

    assert_equal "<h1>hello", chisel.convert
  end

  # i think we need to find certain characters and convert them
  # to other characters

  # i think we also need to break the code into new lines.

  #we need to test that we can take in a file and read the text


end

/Users/justinpease/.rvm/bin/sib_ruby