When(/^I try to create an empty record for table session it should fail$/) do
  old_count = Session.count
  #session3 = Session.new
  expect {
    FactoryGirl.create(:Session, :Expire => nil, :Last_Activity => nil)
  }.to raise_error(ActiveRecord::StatementInvalid)

  new_count = Session.count
  old_count.should == new_count
end

Then(/^the session cookie data should have been expired on the (#{TABLE_NAME}).$/) do |table_name|
  # session id in @session_id
  #+----------------------------------+---------------------+---------------------+
  #| Session_ID                       | Expire              | Last_Activity       |
  #+----------------------------------+---------------------+---------------------+
  #| a748689f891934b754dc5641144955b9 | 2013-10-10 14:21:51 | 2013-10-10 14:16:51 |
  #+----------------------------------+---------------------+---------------------+
  time_now = Time.now.to_s
  ts = time_now[0,19]
  expiry_time = Object.const_get(table_name).where(:Session_ID => @session_id).pluck(:Expire).first.to_s
  et = expiry_time[0,19]
  (ts <=> et).should == 1 | 0
end