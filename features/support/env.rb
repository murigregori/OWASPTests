require 'watir'
Before do
  @browser = Watir::Browser.new :chrome
end
After do
  @browser.cookies.clear
  @browser.close
end