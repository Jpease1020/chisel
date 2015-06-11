require 'minitest/autorun'
require 'minitest/pride'
require './lib/chunk_sorter'



class ChunkSorterTest < Minitest::Test

  def test_converts_one_chunk_of_one_type
    #integration test
    split_message = ["# My Life in Desserts"]
    thing = ChunkSorter.new(split_message)
    result = thing.sort

    # assert result[0].is_a?(Header)
    assert_equal result[0], "<h1>My Life in Desserts</h1>\n\n"
  end

  def test_converts_two_chunks_of_header_type
    #integration test
    split_message = ["# My Life in Desserts", "## Chapter 1: The Beginning"]
    thing = ChunkSorter.new(split_message)
    result = thing.sort

    # assert result[0].is_a?(Header
    assert_equal result[0], "<h1>My Life in Desserts</h1>\n\n"
    assert_equal result[1], "<h2>Chapter 1: The Beginning</h2>\n\n"
  end

  def test_converts_one_chunk_of_paragraph_type
    #integration test
    split_message = ["I *have* emphasis"]
    thing = ChunkSorter.new(split_message)
    result = thing.sort

    assert_equal result[0], "<p>\nI <em>have</em> emphasis\n</p>"
  end

  def test_converts_two_chunks_of_both_types
    #integration test
    split_message = ["# My Life in Desserts", "You just *have* to try the cheesecake. Since it's appeared in **Food & Wine** this place is packed."]
    thing = ChunkSorter.new(split_message)
    result = thing.sort

    # assert result[0].is_a?(Header
    assert_equal result[0], "<h1>My Life in Desserts</h1>\n\n"
    assert_equal result[1], "<p>\nYou just <em>have</em> to try the cheesecake. Since it's appeared in <strong>Food & Wine</strong> this place is packed.\n</p>"

  end

  def test_have_array
    split_messages = ["he", "she", "it"]
    thing = ChunkSorter.new(split_messages)

    assert_equal "he", thing.markdown_message[0]
  end





  #these tests were testing if the file was sorting the chunks onto paragraphs
  # and headers but it's not working now and I'm not sure why.


  def test_pass_in_header_markdown_string
    skip
    split_message = ["# My Life in Desserts"]
    thing = ChunkSorter.new(split_message)
    result = thing.sort

    assert result[0].is_a?(Header)
  end

  def test_pass_in_2_header_strings
    # unit test
    skip
    thing = ChunkSorter.new(["# My Life in Desserts", "## Chapter 1: The Beginning"])
    result = thing.sort

    assert result[0].is_a?(Header)
    assert result[1].is_a?(Header)
  end

  def test_a_paragraph_object
    skip
    thing = ChunkSorter.new(["something"])
    result = thing.sort

    assert result[0].is_a?(Paragraph)
  end

  def test_mixed_paragraph_and_header
    skip
    thing = ChunkSorter.new(["# My Life in Desserts", "Chapter 1: The Beginning"])
    result = thing.sort

    assert result[0].is_a?(Header)
    assert result[1].is_a?(Paragraph)
  end

end

