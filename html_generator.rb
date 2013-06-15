class HtmlGenerator

	attr_reader :main, :extra

	def initialize(main,extra)
		@main = main
		@extra = extra
	end

	def index

	end

	def print_header
		puts "<html>"
	end
end