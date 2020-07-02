require 'watir'
Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end
After do
  @browser.cookies.clear
  @browser.close
end