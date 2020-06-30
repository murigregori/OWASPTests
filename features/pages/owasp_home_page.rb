require 'page-object'

class OWASPHomePage 
  include PageObject
  
  span(:owasp_logo, :text => 'OWASP Juice Shop')
  button(:account_btn, :id => 'navbarAccount')
  button(:login_btn, :aria_label => 'Go to login page')
  
  
  def go_to_owasp_site
    @browser.goto('http://139.99.96.214:3000')
  end
  
  def go_to_login_page
    account_btn
    sleep 2
    login_btn
  end

  def close_cookies
    @browser.link(:aria_label => 'dismiss cookie message').when_present.click
  end
end