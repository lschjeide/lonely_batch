require "nokogiri"

class Location
  def initialize(name, noko)
    @name = name
    @noko = noko
  end
  
  def get_name
  	@name
  end
  
  def get_lower
	xml_request = @noko.xpath("//*/node[node_name = '#{@name}']").children.reject{|x| x.inner_text.strip.empty? or x.text == @name }.map{ |x| x.inner_text.split("\n")[1].strip }.join(", ")
  	
  	xml_request
  	
  end
  
  def get_higher
  	out_array = Array.new()
  	xml_request = @noko.xpath("//*/node[node_name = '#{@name}']/..")
  	while xml_request.inner_text.split("\n")[1].strip != "World"
	
		out_array.push(xml_request.inner_text.split("\n")[1].strip)
		xml_request = xml_request.xpath("..")
		
	end
	
	out_array.push("World")
	
	out_array.reverse.join(", ")
  	
  end
  
end