#Paragraph.new(Header.new(ChunkSorter.new((MessageChunker.new(markdown_text).chunk_message)).sort))

#chunk sorter takes in the markdown_message (which is the message broken down into chunks and is an array of each chunk as a string)
# from ???? and then evaluates the chunk to sort it as a paragraph or a header.  If its a paragraph its runs it through the
# Paragraph file and makes the needed changes and if it is a header its runs it through the header file and makes the needed changes

require_relative 'header'
require_relative 'paragraph'

class ChunkSorter

  attr_reader :markdown_message

  def initialize(markdown_message)
    @markdown_message = markdown_message
  end

  def sort
    @markdown_message.map do |chunk|
      if chunk.start_with?("#")
        Header.new(chunk).header_convert
      else
        Paragraph.new(chunk).paragraph_convert
      end
    end
  end

end


