require_relative '../pages/owasp_dialog.rb'
require_relative '../pages/owasp_home_page.rb'
require_relative '../pages/owasp_login_page.rb'
require_relative '../pages/owasp_account_page.rb'
require_relative '../pages/owasp_product_card.rb'
require_relative '../pages/owasp_basket_page.rb'

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

Given(/^the user has added an item to the cart$/) do
@product_name = 'Apple Juice (1000ml)'
@owasp_acct_page = OWASPAccountPage.new(@browser)
expect(@owasp_acct_page).present?
@owasp_product = OWASPProductCard.new(@browser)
sleep 2
@owasp_product.add_to_cart(@product_name)
sleep 2
end

When(/^the user checks out their cart$/) do
@owasp_acct_page = OWASPAccountPage.new(@browser)
expect(@owasp_acct_page).present?
@owasp_acct_page.open_shopping_cart
sleep 2
@owasp_basket = OWASPBasketPage.new(@browser)
expect(@owasp_basket).present?
@product_price = @owasp_basket.return_total
@product_price.slice! "Total Price: "
@owasp_basket.checkout
end

When(/^the user picks their address$/) do
@address = 'test test, test, test, 1234'
@owasp_address_page = OWASPAddressPage.new(@browser)
expect(@owasp_address_page).present?
@owasp_address_page.pick_address(@address)
log(@product_name)
log(@address)
log(@product_price)
end