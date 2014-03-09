require "nokogiri"

class Location
  def initialize(name, noko_tax, noko_destin)
    @name = name
    @noko_tax = noko_tax
    @noko_dest = noko_destin
  end
  
  def get_name
  	@name
  end
  
  def get_lower
	xml_request = @noko_tax.xpath("//*/node[node_name = '#{@name}']").children.reject{|x| x.inner_text.strip.empty? or x.text == @name }.map{ |x| x.inner_text.split("\n")[1].strip }.join(", ")
  	
  	xml_request
  	
  end
  
  def get_higher
  	out_array = Array.new()
  	xml_request = @noko_tax.xpath("//*/node[node_name = '#{@name}']/..")
  	while xml_request.inner_text.split("\n")[1].strip != "World" #precarious
	
		out_array.push(xml_request.inner_text.split("\n")[1].strip)
		xml_request = xml_request.xpath("..")
		
	end
	
	out_array.push("World")
	
	out_array.reverse.join(", ")
  	
  end
  
  def get_id
  	xml_request = @noko_tax.xpath("//*/node[node_name = '#{@name}']/@atlas_node_id")
  	xml_request.text
  end
  
  def get_intro
  	id = (get_id).strip
  	xml_request = @noko_dest.xpath("//destinations/destination[@atlas_id='#{id}']/introductory/introduction/overview")
  	xml_request.text.strip
  end  
  
  def get_history
  	id = (get_id).strip
  	xml_request = @noko_dest.xpath("//destinations/destination[@atlas_id='#{id}']/history/history/history")
  	xml_request.text.strip
  end  
  
  def get_history_overview
  	id = (get_id).strip
  	xml_request = @noko_dest.xpath("//destinations/destination[@atlas_id='#{id}']/history/history/overview")
  	xml_request.text.strip
  end
  
  
  
end