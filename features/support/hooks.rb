require 'watir-webdriver'

Before("@normal,@load_test,@db") do
  @browser = Watir::Browser.new :firefox
  #@browser.goto 'www.motgarages.co.uk/password/identify'
  @browser.goto 'https://dv-dep-1:8443/password/identify'

  @session_id = on(HomePage).session_id
end

After("@normal,@load_test,@db") do |scenario|
  if scenario.failed? then
    ext = Time.new.to_s.gsub(" ","").gsub(":","_")
    @browser.screenshot.save "evidence/failure-#{ext}.png"
  end
  @browser.close
end