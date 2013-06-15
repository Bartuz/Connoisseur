require_relative 'html_generator'
class Router

  initialize(main,extra)
    @page = HtmlGenerator.new(main,extra)
    case main
    when 'index' then @page.index
    when 'show' then extra!= nil @page.show : "Wrong id #{extra}"
    else "No action #{main}"
    end
  end

end
def no_arguments
  puts "No arguments.\nNext time time ruby router.rb command(index/show) extra_info(id/product name) > name_of_file(not nescesary)" 
end
ARGV.empty? ? no_arguments : Router.new(ARGV[0], ARGV[1])