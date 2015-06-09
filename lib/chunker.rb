class Chunker

attr_reader :message

  def initialize(message)
    @message = message
  end

  def chunk_it
    @message.split("\n\n")
  end

end

