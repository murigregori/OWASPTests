require_relative '../pages/owasp_dialog.rb'
require_relative '../pages/owasp_home_page.rb'
require_relative '../pages/owasp_login_page.rb'
require_relative '../pages/owasp_account_page.rb'

Given(/^the user is in the OWASP Shop Home page$/) do
@owasp_home_page = OWASPHomePage.new(@browser)
@owasp_home_page.go_to_owasp_site
@owasp_dialog = OWASPDialog.new(@browser)
sleep 2
expect(@owasp_dialog).present?
sleep 2
@owasp_dialog.dismiss_dialog
sleep 2
expect(@owasp_home_page).present?
end

When(/^the user logs in with correct credentials$/) do
@owasp_home_page = OWASPHomePage.new(@browser)
expect(@owasp_home_page).present?
@owasp_home_page.go_to_login_page
@owasp_login_page = OWASPLoginPage.new(@browser)
expect(@owasp_login_page).present?
@owasp_login_page.login("test@test.com", "abcd1234")
end

Then(/^the user should be logged in successfully to their account$/) do
@owasp_account = OWASPAccountPage.new(@browser)
expect(@owasp_account).present?
end