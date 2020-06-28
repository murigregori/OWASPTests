require_relative '../pages/search_page.rb'
Given(/^a user is in the Amazon home page$/) do
@amazon_page = SearchPage.new(@browser)
@amazon_page.visit_amazon_site
end
When(/^a user searches for "([^"]*)"$/) do |keyword|
@amazon_page.search_box_element.wait_until(&:present?)
@amazon_page.enter_search_keyword(keyword)
@amazon_page.click_search_button
end
Then(/^the user should see the results for "([^"]*)"$/) do |arg|
expect(@amazon_page.search_results_present?(arg)).to eql(true)
@amazon_page.close
end