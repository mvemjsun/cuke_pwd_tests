When(/^I try to create a securitylog without userid it should fail\.$/) do
  expect {
     FactoryGirl.create(:Securitylog, :UserID => nil, :ChangeResult => nil, :Questions => nil)
   }.to raise_error(ActiveRecord::StatementInvalid)
end

When(/^the change result of the (#{TABLE_NAME}) should be set to (.+?)$/) do   |table_name,status|
  expected_last_change_status = (status =~ /succe/i) ? 'S' : 'F'
  change_result = Object.const_get(table_name).where(:ChangeResult => expected_last_change_status).pluck(:ChangeResult).first
  expected_last_change_status.should == change_result
end

When(/^no entry should be created in (#{TABLE_NAME})$/) do  |table_name|
  row_count = Object.const_get(table_name).count
  row_count.should == 0
end

##
# get questions presented from the page and compare against the meta data stored in the
# database for the user whose password is being changes. Both should match
#
Then(/^questions presented should be stored correctly in (#{TABLE_NAME})$/) do |table_name|
  on(ConfirmPage) do |page|
    presented_question_data = page.security_questions_presented
    user_name = page.userid
    # s:27:"DOB+3/MOTHER+1,5/FATTWN+2,3";
    db_q = Object.const_get(table_name).where(:UserID => user_name).pluck(:questions).first
    pattern = /"(?<saved_data>.+)"/
    db_q =~ pattern
    @match = $~[:saved_data]
    @match.gsub!(/"/, "")
    @match.should == presented_question_data
  end
end

When(/^the security log status for the current user should be set to (.+?) in (#{TABLE_NAME})$/) do   |status,table_name|
  expected_last_change_status = (status =~ /succe/i) ? 'S' : 'F'
  current_user = on(ConfirmPage).userid
  change_result = Object.const_get(table_name).where(:UserID => current_user).pluck(:ChangeResult).first
  expected_last_change_status.should == change_result
end
