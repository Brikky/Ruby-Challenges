class XmlDocument
  # TODO: your code goes here!

  attr_reader :spaces

  def initialize(indent = false)
    @indent = indent
    @spaces = 0
  end

  def method_missing(name, *attributes, &blk)
    attributes = attributes[0] || {}
    build_tag(name, attributes, &blk)
  end

  def attribute_strings(attributes)
    attributes.map { |key, value| "#{key}=\"#{value}\"" }
  end

  def close(name)
    "#{tab}</#{name}>#{newline}"
  end

  def indent
    @spaces += 1 if @indent
  end

  def tag(name, attributes)
    "#{tab}<#{tag_body(name, attributes)}/>#{newline}"
  end

  def open(name, attributes)
    "#{tab}<#{tag_body(name, attributes)}>#{newline}"
  end

  def newline
    @indent ? "\n" : ""
  end

  def build_tag(name, attributes, &blk)
    file = ""
    if block_given?
      file << "#{open(name, attributes)}"
      indent
      file << yield
      unindent
      file << "#{close(name)}"
    else
      file << tag(name, attributes)
    end
  end

  def tab
    "  " * spaces
  end

  def tag_body(name, attributes)
    ([name] + attribute_strings(attributes)).join(" ")
  end

  def unindent
    @spaces -= 1 if @indent
  end
end
