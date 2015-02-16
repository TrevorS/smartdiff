module Smartdiff
  class Result
    attr_reader :value, :source_locations, :target_locations

    def self.for_compare
      %i(source target both).each_with_object({}) do |s, h|
        h[s] = []
      end
    end

    def self.source_results(lines)
      lines.each_with_object({}) do |(k, v), h|
        h[k] = Result.new(k, v.locations, nil)
      end
    end

    def self.target_results(lines)
      lines.each_with_object({}) do |(k, v), h|
        h[k] = Result.new(k, nil, v.locations)
      end
    end

    def initialize(value, source_locations, target_locations)
      @value = value
      @source_locations = source_locations || []
      @target_locations = target_locations || []
    end
  end
end
