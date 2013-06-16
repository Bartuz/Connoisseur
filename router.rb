require_relative 'html_generator'
class Router
  
  def initialize(action,extra = nil)
    @page = HtmlGenerator.new
    case action
    when 'index' then @page.index(extra)
    when 'show' then extra!=Fixnum ? @page.show(extra) : "Wrong id #{extra}"
    else "No action #{action}"
    end
  end
end

def no_arguments
  puts "No arguments.\nNext time time ruby router.rb command(index/show) extra_info(id/product name) > name_of_file(not nescesary)" 
end

ARGV.empty? ? no_arguments : Router.new(ARGV[0], ARGV[1])