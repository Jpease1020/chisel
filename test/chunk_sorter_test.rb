require "minitest/autorun"
require "minitest/pride"
require "../lib/chunk_sorter"

class ChunkSorterTest < Minitest::Test

  # def test_stuff_works
  #   assert !!ChunkSorter.new
  # end

  def test_have_array
    split_messages = ["he", "she", "it"]
    thing = ChunkSorter.new(split_messages)

    assert_equal "he", thing.messages[0]
  end

  def test_pass_in_header_markdown_string
    thing = ChunkSorter.new(["# My Life in Desserts"])
    result = thing.sort

    assert result[0].is_a?(Header)
  end

  def test_pass_in_2_header_strings
    thing = ChunkSorter.new(["# My Life in Desserts", "## Chapter 1: The Beginning"])
    result = thing.sort

    assert result[0].is_a?(Header)
    assert result[1].is_a?(Header)
  end

  def test_a_paragraph_object
    thing = ChunkSorter.new(["something"])
    result = thing.sort

    assert result[0].is_a?(Paragraph)
  end

  def test_mixed_paragraph_and_header
    thing = ChunkSorter.new(["# My Life in Desserts", "Chapter 1: The Beginning"])
    result = thing.sort

    assert result[0].is_a?(Header)
    assert result[1].is_a?(Paragraph)
  end
end

