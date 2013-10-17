RSpec::Matchers.define :have_error_message do |actual_message|
	 match do |expected_page|
	 	expected_page.text.include? actual_message
	 end

	failure_message_for_should do |expected_page|
 		"Expected '#{expected_page.text}' to include '#{actual_message}'"
 	end

 	failure_message_for_should_not do |expected_page|
 		"Expected '#{expected_page.text}' to not include '#{actual_message}'"
 	end
end