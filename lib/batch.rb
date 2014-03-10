require "nokogiri"

class Batch


	def initialize(tax_path, dest_path)		
		f = File.open(tax_path) 
  		@noko_tax = Nokogiri::XML(f)
  		f2 = File.open(dest_path) 
  		@noko_destin = Nokogiri::XML(f2)	
	end

	
	
	def all_ids
		#returns an array of all the node ids (world excluded)
		@noko_tax.xpath("//*").children.map{ |x| x.xpath("@atlas_node_id").text }.reject{|x| x.empty? }
	end
	
	def batch_create
	
		#Write the World level as a special case
		loc = Location.new("00000", @noko_tax, @noko_destin)
		write_page_for_location(loc)
		
		#Create a page for each ID in the all_ids array
		all_ids.each do |id|
			location = Location.new(id, @noko_tax, @noko_destin)
			write_page_for_location(location)
		end	
	end

	def write_page_for_location(location)

		#output name
		local_filename = "output_files/" + location.get_id + ".html"
		
		#page content
		doc = "<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8'>
    <title>Lonely Planet</title>
    <link href='static/all.css' media='screen' rel='stylesheet' type='text/css'>
  </head>

  <body>
    <div id='container'>
      <div id='header'>
        <div id='logo'></div>
        <h1>Lonely Planet: #{location.get_name}</h1>
      </div>

      <div id='wrapper'>
        <div id='sidebar'>
          <div class='block'>
            <h3>Navigation</h3>
            <div class='content'>
              <div class='inner'>
              
                #{location.get_higher_ids.map{|x| '<a href=' + x['id'] + '.html >' + x['name'] + '</a>'}.join(' >> ')} 
               
                #{if !location.get_higher_ids.empty? then ">>" end} 
                
                #{location.get_name}
                
                <br><br><br>
                #{location.get_lower_ids.map{|x| '<a href=' + x['id'] + '.html >' + x['name'] + '</a><br>'}.join(' ')}
              </div>
            </div>
          </div>
        </div>

        <div id='main'>
          <div class='block'>
            <div class='secondary-navigation'>
              <ul>
                <li class='first'><a href='#'>#{location.get_name}</a></li>
              </ul>
              <div class='clear'></div>
            </div>
            <div class='content'>
              <div class='inner'>
          		  Introduction
          		  <p>
            		 #{location.get_intro}
            		</p>
            		History Overview
                <p>
                
                  #{location.get_history_overview}
          		  </p>
                <p>
                 #{location.get_history}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>"

	#write to file
	File.open(local_filename, 'w') {|f| f.write(doc) }

	end
	
end

