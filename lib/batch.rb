require "nokogiri"

class Batch


	def initialize(tax_path, dest_path)
		
		f = File.open(tax_path) 
  		@noko_tax = Nokogiri::XML(f)
  		f2 = File.open(dest_path) 
  		@noko_destin = Nokogiri::XML(f2)
	
	end

	def navigation_links
	
	
	end
	
	def all_ids
	
		xml_request = @noko_tax.xpath("//*/node").children.map{ |x| x.xpath("@atlas_node_id").text }.reject{|x| x.empty? }
	
	end
	
	def batch_create
	
		all_ids.each do |id|
		
		
			
		
		end
	
	end

	def write_page_for_name(name)

		document.write("<!DOCTYPE html>
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
        <h1>Lonely Planet: #{@name}</h1>
      </div>

      <div id='wrapper'>
        <div id='sidebar'>
          <div class='block'>
            <h3>Navigation</h3>
            <div class='content'>
              <div class='inner'>
                #{navigation_links()}
              </div>
            </div>
          </div>
        </div>

        <div id='main'>
          <div class='block'>
            <div class='secondary-navigation'>
              <ul>
                <li class='first'><a href='#'>#{@name}</a></li>
              </ul>
              <div class='clear'></div>
            </div>
            <div class='content'>
              <div class='inner'>
          		  Introduction
          		  <p>
            		 #{@intro}
            		</p>
            		History Overview
                <p>
                
                  #{@history_overview}
          		  </p>
                <p>
                 #{@history}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>")

	end
	
end

