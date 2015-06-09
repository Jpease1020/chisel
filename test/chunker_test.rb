require "minitest/autorun"
require "minitest/pride"
require "../lib/chunker"

class ChunkerTest< Minitest::Test

  def test_single_line_to_one_chunk
    chunker = Chunker.new("Hello world")
    result = chunker.chunk_it

    assert_equal 1, result.size
  end

  def test_we_can_get_the_passed_in_message
    chunker = Chunker.new("Hello world")
    result = chunker.message

    assert_equal "Hello world", result
  end

  def test_message_with_2_lines_becomes_2_chunks
    instance = Chunker.new("hi \n\n hello" )
    result = instance.chunk_it

    assert_equal 2, result.size
  end

end

