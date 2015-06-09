class ChunkSorter

  attr_reader :messages

  def initialize(messages)
    @messages = messages
  end

  def sort
    objects = []
    @messages.each do |string|
      if string.start_with?("#")
        objects << Header.new
      else
        objects << Paragraph.new
      end
    end
    objects
  end
end


class Header

end

class Paragraph

end