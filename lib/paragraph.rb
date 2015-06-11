#Paragraph.new(Header.new(ChunkSorter.new((MessageChunker.new(markdown_text).chunk_message)).sort))

#Paragraph gets called in the ChunkSorter, takes in a chunk from ??????? and replaces specific markdown text with the corresponding html text

class Paragraph

  def initialize(chunk) #this is an array coming in with each word as an element
    @words = chunk.split(" ")
  end

  def paragraph_convert
    replace_strongs
    replace_ems
    add_paragraphs
  end

  private

  def add_paragraphs
    "<p>\n#{@words.join(" ")}\n</p>"
  end

  def replace_strongs
    @words.map! do |word|
      if word.start_with?("**") && word.end_with?("**")
        "<strong>#{word.delete("**")}</strong>"
      elsif word.start_with?("**")
        "<strong>#{word.delete("**")}"
      elsif word.end_with?("**")
        "#{word.delete("**")}</strong>"
      else
        word
      end
    end
  end

  def replace_ems
    @words.map! do |word|
      if word.start_with?("*") && word.end_with?("*")
        "<em>#{word.delete("*")}</em>"
      elsif word.start_with?("*")
        "<em>#{word.delete("*")}"
      elsif word.end_with?("*")
        "#{word.delete("*")}</em>"
      else
        word
      end
    end
  end
end


# require 'pry'
# binding.pry


























# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."

# <p>
#     "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
#   <strong>Food &amp; Wine</strong> this place has been packed every night."
# </p>




# message = "You just *have* to try the cheesecake,"
# array = message.split(" ")
