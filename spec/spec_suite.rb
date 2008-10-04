class AttrPrivateSuite
  def run
    files = Dir["#{File.dirname(__FILE__)}/**/*_spec.rb"]
    puts "Running AttrPrivate Suite"
    files.each do |file|
      require file
    end
  end
end
 
if $0 == __FILE__
  AttrPrivateSuite.new.run
end
