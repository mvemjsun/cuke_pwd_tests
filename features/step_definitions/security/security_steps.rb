When(/^I try to visit the (.+?) folder under document root$/) do   |folder_name|
  @browser = Watir::Browser.new :firefox
  @browser.goto "www.motgarages.co.uk/#{folder_name}"
end