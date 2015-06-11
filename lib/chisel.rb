#$ ruby ./lib/chisel.rb my_input.markdown my_output.html
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)

#Paragraph.new(Header.new(ChunkSorter.new((MessageChunker.new(markdown_text).chunk_message)).sort))

#take in the argv and read the file
#call all the classes to do the stuff
#write that stuff to the 2nd argv(html file)

require_relative 'message_chunker'
require_relative 'chunk_sorter'

class Chisel

  def initialize
    #take in the file, convert it, print it to the new file
    @markdowntext = ARGV[0]
    html = convert(markdown_text_method) #this markdown_text_method opens and reads the file.  The contents are then passed to the convert method
    write_to_file(html)
  end



  def markdown_text_method
    reader = File.open(@markdowntext)
    reader.read
    # File.read(@markdowntext)
  end

  def convert(markdown_text)
    #take in markdowntext, separate it into paragraphs and headers
    #then take each and go through the strings and replace all markdown syntax with html
    #convert the contents from markdown to html

    step1_output = MessageChunker.new(markdown_text).chunk_input
    step2_output = ChunkSorter.new(step1_output).sort
    step3_output = Header.new(step2_output)
    Paragraph.new(step3_output)
    #if chunk sorter does all the work......do i need to pass it through them or can I stop at chunk sorter, spit out the value
    #and pass that to write_to_file?
  end

  def write_to_file(html)
    html_text = ARGV[1]
    File.write(html_text, html)
    print "Converted #{ARGV[0]} (6 lines) to #{ARGV[1]} (8 lines)"
  end

end

Chisel.new

