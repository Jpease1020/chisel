require 'minitest/autorun'
require 'minitest/pride'
require './lib/paragraph'




class ParagraphTest < MiniTest::Test
#the paragraph will take the chunk of markdown that is a paragraph and
# turn it into html


  # skipped tests were testing before we made the methods private

  def test_it_can_convert_a_simple_string
    skip
    string = "This is a string"
    message = Paragraph.new(string)

    assert_equal "<p>\nThis is a string\n</p>", message.add_paragraphs
  end

  # iterate through object and search for certain elements and then
  # replace them with new ones

  #then add <p> and </p> to the beginning and end respectively
  def test_we_can_replace_one_item_of_one_type
    skip
    paragraph = Paragraph.new("I **have** strong")
    assert_equal ["I", "<strong>have</strong>", "strong"], paragraph.replace_strongs
  end

  def test_replace_single_emphasis
    skip
    paragraph = Paragraph.new("I *have* emphasis")
    assert_equal ["I", "<em>have</em>", "emphasis"], paragraph.replace_ems
  end

  def test_it_replaces_all
    paragraph = Paragraph.new("You just *have* to try the cheesecake he said. Ever since it appeared in **Food & Wine** this place has been packed every night.")
    assert_equal "<p>\nYou just <em>have</em> to try the cheesecake he said. Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.\n</p>", paragraph.paragraph_convert
  end

  # paragraph = Paragraph.new("You just *have* to try the cheesecake,")
  # assert_equal "<p>/nYou just <em>have</em> to try the cheesecake,\n</p>", paragraph.convert


end