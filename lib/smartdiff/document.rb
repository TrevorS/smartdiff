module Smartdiff
  class Document
    attr_reader :name, :lines

    def initialize(name)
      @name  = name
      @lines = Hash.new { |lines, data| lines[data] = Line.new(data) }
    end

    def add(line, location)
      @lines[line] << location
    end

    def [](line)
      @lines[line]
    end

    def delete(line)
      @lines.delete(line)
    end
  end
end
