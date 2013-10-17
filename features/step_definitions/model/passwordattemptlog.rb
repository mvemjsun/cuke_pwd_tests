When(/^the attempt count in (#{TABLE_NAME}) should be set to (\d+)$/) do   |table_name,attempt_count|
  cnt = Object.const_get(table_name).where(:Attempt_Count => attempt_count).pluck(:Attempt_Count).first
  cnt.should == attempt_count.to_i
end

Then(/^an entry should be created in the (#{TABLE_NAME}) for the password attempt$/) do |table_name|
  Object.const_get(table_name).count.should >= 1
  Object.const_get(table_name).where(:UserID => Userdata.VALID_UNKNOWN_USER).pluck(:UserID).first.should == Userdata.VALID_UNKNOWN_USER
end