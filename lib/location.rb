require "nokogiri"

class Location
  def initialize(id, noko_tax, noko_destin)
    @id = id
    @noko_tax = noko_tax
    @noko_dest = noko_destin
  end
  
  def get_name
 	if @id == "00000"
 		return "World"
 	end
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/node_name")
  	xml_request.text.strip
  end
  
  def get_lower
  	path = "//*/node[@atlas_node_id = '#{@id}']"
    if @id == "00000"
    	path = "//*[count(ancestor::node())=2]"
    end
	xml_request = @noko_tax.xpath(path).children.reject{|x| x.inner_text.strip.empty? or x.text.strip == get_name }.map{ |x| x.text.split("\n")[1].strip }
	
  end
  
  def get_lower_ids
    path = "//*/node[@atlas_node_id = '#{@id}']"
    if @id == "00000"
    	path = "//*[count(ancestor::node())=2]"
    end
  	xml_request = @noko_tax.xpath(path).children.reject{|x| x.nil? or x.text.strip.empty? or x.text.strip == get_name }.map{ |x| {"id" => x.xpath("@atlas_node_id").text.to_s, "name" => x.text.split("\n")[1].to_s} }
  	
  end
  
  def get_higher
  	out_array = Array.new()
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/..")
  	while xml_request.inner_text.split("\n")[1].strip != "World" #precarious
	
		out_array.push(xml_request.inner_text.split("\n")[1].strip)
		xml_request = xml_request.xpath("..")
		
	end
	
	if @id != "00000"
		out_array.push("World")
	end
	
	out_array.reverse
  end
  
  def get_higher_ids
  	out_array = Array.new()
  	xml_request = @noko_tax.xpath("//*/node[@atlas_node_id = '#{@id}']/..")
  	while !xml_request.nil? and !xml_request.inner_text.split("\n")[1].nil?
  	  id_text = xml_request.xpath("@atlas_node_id").text.strip
  	  name_text = xml_request.inner_text.split("\n")[1].strip
  	  if !name_text.empty? and !id_text.empty?
		out_array.push({"id" => id_text, "name" => name_text})
	  end
	
	  xml_request = xml_request.xpath("..")
	end
	
	if @id != "00000"
		out_array.push({"id" => "00000", "name" => "World"})
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