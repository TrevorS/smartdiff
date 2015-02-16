module Smartdiff
  class Line
    attr_reader :data, :locations

    def initialize(data)
      @data, @locations = data, []
    end

    def <<(location)
      @locations << location
    end
  end
end
