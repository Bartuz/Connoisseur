require 'open-uri'
require 'JSON'
require 'pry'
class HtmlGenerator

	def index(search)

		print_header
		puts "<h1>Products:</h1>"
		products = retrive_data("http://lcboapi.com/products?q=#{search}")
		products.each do |product|
	   		puts "<div class='product'>"
		    puts "  <h2>#{product['name']}</h2>"
		    puts "  <img src='#{product['image_thumb_url']}'  class='product-thumbnail'/>"
		    puts "  <ul class='product-data'>"
		    puts "    <li>id: #{product['id']}</li>"
		    puts "    <li>#{product['producer_name']}</li>"
		    puts "    <li>#{product['primary_category']}</li>"
		    puts "    <li>#{product['secondary_category']}</li>"
		    puts "    <li>#{product['volume_in_milliliters']} ml</li>"
		    puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
		    puts "  </ul>"
		    puts "</div>"
		end
		print_footer
	end

	def show(id)
		product = retrive_data("http://lcboapi.com/products/##{id}")
	    print_header
	    puts "<div class='product'>"
	    puts "  <h2>#{product['name']}</h2>"
	    puts "  <img src='#{product['image_url']}'  class='product-image'/>"
	    puts "  <ul class='product-data'>"
	    puts "    <li>id: #{product['id']}</li>"
	    puts "    <li>#{product['producer_name']}</li>"
	    puts "    <li>#{product['primary_category']}</li>"
	    puts "    <li>#{product['secondary_category']}</li>"
	    puts "    <li>#{product['origin']}</li>"
	    puts "    <li>#{product['volume_in_milliliters']} ml</li>"
	    puts "    <li>#{product['package']}</li>"
	    puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
	    puts "    <li>#{product['serving_suggestion']}</li>"
	    puts "    <li>#{product['tasting_note']}</li>"
	    puts "    <li>Tags: #{product['tags']}</li>"
	    puts "  </ul>"
	    puts "</div>"
	    print_footer
	end

	private

	def retrive_data(url)
		# Retrieve JSON-formatted text from lcboapi.com
   		raw_response = open(url).read
    	# Parse JSON-formatted text into a Ruby Hash
    	parsed_response = JSON.parse(raw_response)

    	# Return just the actual result data from the response, ignoring metadata
    	result = parsed_response["result"]
	end

	def print_header
	    puts "<html>"
	    puts "  <head>"
	    puts "    <title>Filip's Page</title>"
	    puts "    <link rel='stylesheet' href='normalize.css' type='text/css'>"
	    puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
	    puts "  </head>"
	    puts "  <body>"
  	end

  	def print_footer
    	puts "  </body>"
	    puts "</html>"
	end

	def format_price(cents_string)
    cents_string.to_f/100
  	end

end