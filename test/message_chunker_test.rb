require 'minitest/autorun'
require 'minitest/pride'
require './lib/message_chunker'

class ChunkerTest< Minitest::Test

  def test_single_line_to_one_chunk
    chunker = MessageChunker.new("Hello world")
    result = chunker.chunk_input

    assert_equal 1, result.size
  end

  def test_we_can_get_the_passed_in_message
    chunker = MessageChunker.new("Hello world")
    result = chunker.file_input

    assert_equal "Hello world", result
  end

  def test_message_with_2_lines_becomes_2_chunks
    instance = MessageChunker.new("hi \n\n hello" )
    result = instance.chunk_input

    assert_equal 2, result.size
  end

  def test_full_text_file_can_be_chunked
    text = "# My Life in Desserts \n\n## Chapter 1: The Beginning \n\n You just *have* to try the cheesecake,"
    instance = MessageChunker.new(text)
    result = instance.chunk_input

    assert_equal 3, result.size
  end

end

