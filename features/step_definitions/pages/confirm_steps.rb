And (/^the password confirmation page should have 3 questions presented to the user$/) do
	on(ConfirmPage) do |page|
		page.question_count.should == 3
	end
end

Then(/^I should be presented with 3 security questions having valid character positions$/) do
  on(ConfirmPage) do |page|
    page.questions_should_not_have_invalid_answer_characters.should == true
  end
end
Then(/^I try to change the password$/) do
  on(ConfirmPage).change_password
end

Then (/^I answer the security questions correctly for valid user$/) do
  on(ConfirmPage).answer_questions_correctly
end

Then (/^I answer the security questions for invalid user$/) do
  pending
end

Then (/^I answer the security questions for valid unknown user$/) do
  on(ConfirmPage).enter_valid_format_but_wrong_form_data
end

Then(/^I should be able to change the password with success$/) do
  ack_page = on(ConfirmPage).change_password_with_success
  ack_page.text.include?("Your reset has been successful").should == true
end

When(/^I try to change my password too many times$/) do
  6.times do
    on(ConfirmPage).enter_valid_format_but_wrong_form_data
    on(ConfirmPage).change_password
  end
end

When(/^I try to change my password 4 times$/) do
  4.times do
    on(ConfirmPage).enter_valid_format_but_wrong_form_data
    on(ConfirmPage).change_password
  end
end

When(/^I change to cookie contents to an unknown cookie$/) do
  @browser.cookies.clear
  @browser.cookies.add 'motgarages', '64e7f2053c46759dcda4ed94f9dxxxxx', :name => ".motgarages.co.uk" ,:path => "/password", :expires => 0, :secure => false
end

When(/^I change to cookie contents to have malacious text (.+?)$/) do |malacious_text|
  @browser.cookies.clear
  @browser.cookies.add 'motgarages', "#{malacious_text}", :name => ".motgarages.co.uk" ,:path => "/password", :expires => 0, :secure => false
end

When(/^I change to cookie contents greater than 32 bytes $/) do
  @browser.cookies.clear
  @browser.cookies.add 'motgarages', "#64e7f2053c46759dcda4ed94f9dxxxxxxxx", :name => ".motgarages.co.uk" ,:path => "/password", :expires => 0, :secure => false
end

When(/^all the security questions should have non repeating characters being asked$/) do
  on(ConfirmPage).duplicate_answer_characters.should_not == true
end