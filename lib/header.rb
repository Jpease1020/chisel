#Paragraph.new(Header.new(ChunkSorter.new((MessageChunker.new(markdown_text).chunk_message)).sort))

# Header gets called in the ChunkSorter and takes in a chunk from ?????? and replaces the ###'s with the corresponding <h1>, <h2>, <h3> etc'

class Header

  def initialize(chunk)
    @chunk = chunk
  end

  def header_convert
    space_index = @chunk.index(" ")
    without_markdown = @chunk[space_index + 1..-1]
    "<h#{space_index}>#{without_markdown}</h#{space_index}>\n\n"
  end

end


