module TheoryHelper
  DIR = "#{__dir__}/../views/theory/pages"

  def self.pages
    Dir.entries(DIR).select{ |x| !File.directory?(File.join(DIR, x)) }.map{ |x| x.partition('.').first }.sort_by(&:to_i)
  end
end
