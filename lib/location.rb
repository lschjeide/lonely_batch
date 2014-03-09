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
  
end