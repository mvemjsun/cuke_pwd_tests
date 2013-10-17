Given(/^I visit the change password website$/) do
  visit(HomePage)
end

Then(/^I should see an error message "(.*?)"$/) do |message|
  	@browser.span(:id => 'error_explanation').wait_until_present
  	@current_page.should have_error_message message
end

Then(/^I should see a page with text "(.*?)"$/) do |message|
  	Watir::Wait.until { @browser.text.include? "#{message}" }
  	@current_page.should have_error_message message
end

Then(/^I should see message "(.*?)"$/) do |message|
  Watir::Wait.until { @browser.text.include? "#{message}" }
  @browser.text.include?(message).should == true
end

Then(/^I should see apache message "(.*?)"$/) do |message|
  Watir::Wait.until { @browser.text.include? "#{message}" }
  @browser.text.include?(message).should == true
end

Then(/^I should not see text "(.*?)"$/) do |message|
  @browser.text.include?(message).should == false
end

When(/^the page title should be correct$/) do
  @browser.title.should == PageHTMLConfig.html_page_title
end