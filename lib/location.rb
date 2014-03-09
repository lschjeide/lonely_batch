require "nokogiri"

class Location
  def initialize(id, noko_tax, noko_destin)
    @id = id
    @noko_tax = noko_tax
    @noko_dest = noko_destin
  end
  
  def get_name
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/node_name")
  	xml_request.text.strip
  end
  
  def get_lower
  	
	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']").children.reject{|x| x.inner_text.strip.empty? or x.text.strip == get_name }.map{ |x| x.text.split("\n")[1].strip }
  end
  
  def get_lower_ids
  
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']").children.reject{|x| x.inner_text.strip.empty? or x.text.strip == get_name }.map{ |x| x.xpath("@atlas_node_id").text }
  	
  end
  
  def get_higher
  	out_array = Array.new()
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/..")
  	while xml_request.inner_text.split("\n")[1].strip != "World" #precarious
	
		out_array.push(xml_request.inner_text.split("\n")[1].strip)
		xml_request = xml_request.xpath("..")
		
	end
	
	out_array.push("World")
	
	out_array.reverse
  	
  end
  
  def get_higher_ids
  	out_array = Array.new()
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/..")
  	while xml_request.inner_text.split("\n")[1].strip != "World" #precarious
	
		out_array.push(xml_request.xpath("@atlas_node_id").text)
		xml_request = xml_request.xpath("..")
		
	end
	
	out_array.reverse
  	
  end
  
  def get_id
  	@id
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