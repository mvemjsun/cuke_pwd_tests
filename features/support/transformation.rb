	TABLE_NAME = Transform /^table (.+?)$/ do |table_name|
	    table_name.capitalize
	end
