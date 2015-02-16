require 'smartdiff/version'
require 'smartdiff/document'
require 'smartdiff/line'
require 'smartdiff/result'

module Smartdiff
  def self.load(file)
    doc = Document.new(File.basename(file))
    File.open(file, 'rb').each_with_object(doc).with_index do |(l, d), i|
      d.add(l.strip, i + 1)
    end
  end

  def self.compare(source, target)
    results = target.lines.each_with_object(Result.for_compare) do |(d, _), r|
      if source.lines.key?(d)
        r[:both] << Result.new(d, source[d].locations, target[d].locations)
        source.delete(d) && target.delete(d)
      end
    end
    results[:source] = Result.source_results(source.lines)
    results[:target] = Result.target_results(target.lines)
    results
  end
end
