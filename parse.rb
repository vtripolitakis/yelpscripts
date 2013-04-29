require 'json'

fields_of_interest = ARGV

begin

	parsed_json = JSON.parse(STDIN.read)


rescue JSON::ParserError

	abort("EXIT: invalid JSON data")

end


if (parsed_json.count()>1) #just a hack...

	parsed_json.each do |element|
		
		element_array= Array.new
		
		fields_of_interest.each do |field|
			
			if (element.has_key?(field)) 
				if (element[field].is_a?(Array))
					element_array.push(element[field].join(";"))
				else	
					element_array.push(element[field])
				end
			else
				abort ("EXIT: field "+field+" does not exist")
			end

		end
		puts element_array.join(",")
	
	end
else
	abort ("EXIT: empty json array")
end

