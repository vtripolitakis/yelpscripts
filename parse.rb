=begin
 * Simple Json parser for Yelp (and not only ) datasets for the Kaggle Contest
 *
 * Copyright 2013, Evangelos Tripolitakis - http://about.me/vtripolitakis
 * Released under the MIT Licence
 * http://opensource.org/licenses/MIT
 *
 * Github:  http://github.com/vtripolitakis/yelpscripts
 * Version: 0.0.1
=end

require 'json'

if ARGV.empty?
	abort ("EXIT: no fields entered")	
end


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
				elsif (element[field].is_a?(Hash)) #flatten hash table and return values separated by commas (request by Danny Bickson)			
					element_array.push(element[field].values.join(","))
				else					
					element_array.push(element[field])
				end
			else
				abort("EXIT: field "+field+" does not exist")
			end

		end
		puts element_array.join(",")
	
	end
else
	abort("EXIT: empty json array")
end
