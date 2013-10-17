
When(/^I try to create a session_data without session id it should fail$/) do
  expect {
     FactoryGirl.create(:Sessiondata, :Session_ID => nil, :Data_Key => nil, :Data_Value => nil)
   }.to raise_error(ActiveRecord::StatementInvalid)
end
