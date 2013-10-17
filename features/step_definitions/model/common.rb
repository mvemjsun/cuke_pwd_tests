
When(/^I try to insert data into (#{TABLE_NAME}) it should be successfully inserted$/) do |table_name|
	expect {
  		FactoryGirl.create(table_name.to_sym)
	}.to change(Object.const_get(table_name), :count).by(1)
end

When(/^I create duplicate data into (#{TABLE_NAME}) it should be rejected$/) do |table_name|
    FactoryGirl.create(table_name.to_sym)
	expect {
		FactoryGirl.create(table_name.to_sym)
	}.to raise_error(ActiveRecord::RecordNotUnique)
end