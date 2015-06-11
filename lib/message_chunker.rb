#Paragraph.new(Header.new(ChunkSorter.new((MessageChunker.new(markdown_text).chunk_message)).sort))

#MessageChunker takes in the entire markdown file from ???????? and splits it up into chunks

class MessageChunker

  attr_reader :file_input

  def initialize(file_input)
    @file_input = file_input
  end

  def chunk_input
    @file_input.split("\n\n")
  end

end


