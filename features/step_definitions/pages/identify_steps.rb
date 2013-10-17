When(/^I supply a userid whose format is invalid$/) do
  on(HomePage).enter_invalid_userid
end

When(/^I dont supply a userid$/) do
  on(HomePage).enter_no_userid
end

When(/^A user tries to use the password portal too many times to change his password$/) do
  on(HomePage).attempt_too_many_changes
end

When(/^A user tries to use the portal and communication with the central server is not available$/)do
  on(HomePage).enter_valid_userid
end

When (/^I visit the portal and supply a correctly formatted unknown userid$/) do
	on(HomePage).enter_valid_but_unknown_userid
end

Given(/^I visit the portal and supply a correctly formatted known userid$/) do
  on(HomePage).enter_valid_userid
end

Then(/^I should be locked out of the portal$/) do
  @browser.text.include?("You are not allowed to change the password currently").should == true
end
Given(/^I visit the portal and supply a userid who is locked on the central server$/) do
  on(HomePage).enter_locked_userid
end
Given(/^I visit the portal and supply a userid who has no active roles on the central server$/) do
  on(HomePage).enter_userid_with_no_roles
end

Given(/^I visit the portal and supply a userid who does not have enough verification details on the central server$/) do
  on(HomePage).enter_userid_with_less_security_details
end
When(/^I try to login as user (.*?)$/) do |user_id|
  on(HomePage).identify_with(user_id)
end