Given(/^the user is in the OWASP Shop Home page$/) do
owasp_home_page = OWASPHomePage.new(@browser)
owasp_home_page.go_to_owasp_site
sleep 2
owasp_home_page.close_cookies
owasp_dialog = OWASPDialog.new(@browser)
sleep 2
expect(owasp_dialog).present?
sleep 2
owasp_dialog.dismiss_dialog
sleep 2
expect(owasp_home_page).present?
end

Given(/^the user is in the Home page$/) do
owasp_acct_page = OWASPAccountPage.new(@browser)
expect(owasp_acct_page).present?
end

When(/^the user logs in with correct credentials$/) do
owasp_home_page = OWASPHomePage.new(@browser)
expect(owasp_home_page).present?
owasp_home_page.go_to_login_page
owasp_login_page = OWASPLoginPage.new(@browser)
expect(owasp_login_page).present?
owasp_login_page.login("test@test.com", "abcd1234")
end

Given(/^the user has added "([^"]*)" to the cart$/) do |item|
@product_name = item
owasp_acct_page = OWASPAccountPage.new(@browser)
expect(owasp_acct_page).present?
owasp_product = OWASPProductCard.new(@browser)
sleep 2
owasp_product.add_to_cart(@product_name)
sleep 2
end

When(/^the user checks out their cart$/) do
owasp_acct_page = OWASPAccountPage.new(@browser)
expect(owasp_acct_page).present?
owasp_acct_page.open_shopping_cart
sleep 2
owasp_basket = OWASPBasketPage.new(@browser)
expect(owasp_basket).present?
@product_price = owasp_basket.return_total
@product_price.slice! "Total Price: "
owasp_basket.checkout
end

When(/^the user picks their address$/) do
@address = 'test test, test, test, 1234'
owasp_address_page = OWASPAddressPage.new(@browser)
expect(owasp_address_page).present?
owasp_address_page.pick_address(@address)
end

When(/^the user picks their delivery option$/) do
@delivery = '3 Days'
owasp_delivery_page = OWASPDeliveryOptions.new(@browser)
expect(@owasp_delivery_page).present?
sleep 2
owasp_delivery_page.pick_delivery_speed(@delivery)
end

When(/^the user pays with their OWASP wallet$/) do
owasp_payment_page = OWASPPaymentOptions.new(@browser)
expect(owasp_payment_page).present?
sleep 2
owasp_payment_page.payment_via_wallet
end

Then(/^the user should see the order summary$/) do
owasp_order_summary = OWASPOrderSummary.new(@browser)
expect(owasp_order_summary).present?
sleep 2
final_total = owasp_order_summary.return_total_price
expect(final_total).to eql(@product_price)
owasp_order_summary.checkout_order
end

Then(/^the user should be notified that their order has been placed$/) do
owasp_order_success = OWASPOrderSuccess.new(@browser)
expect(owasp_order_success).present?
final_address = owasp_order_success.return_address
final_product_name = owasp_order_success.return_product
final_delivery = owasp_order_success.return_delivery
final_delivery.slice! "Your order will be delivered in "
final_delivery.slice! "."
final_total = owasp_order_success.return_price

expect(final_product_name).to eql(@product_name)
expect(final_address).to eql(@address)
expect(final_total).to eql(@product_price)
expect(final_delivery).to eql(@delivery.downcase)
end

When(/^the user leaves a review for "([^"]*)"$/) do |item|
@review = "I really like this " + item
owasp_acct_page = OWASPAccountPage.new(@browser)
expect(owasp_acct_page).present?
owasp_product = OWASPProductCard.new(@browser)
sleep 2
owasp_product.leave_review_for_product(item, @review)
sleep 2
end

Then(/^the user should see that the review has been posted$/) do
owasp_acct_page = OWASPAccountPage.new(@browser)
expect(owasp_acct_page).present?
owasp_product = OWASPProductCard.new(@browser)
seen = owasp_product.view_review(@review)
expect(seen).to eq true
end

