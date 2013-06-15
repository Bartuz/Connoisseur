class Router


  initialize(main,extra)
    @html = Html_generator.new(main,extra)
    case main
    when 'index' then @html.index
    when 'show' then extra!= nil @html.show : "Wrong id #{extra}"
    else "No action #{main}"
    end
  end


end

Router.new(ARGV[0], ARGV[1])