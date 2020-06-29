require 'page-object'

class OWASPAccountPage 
  include PageObject
  
  span(:owasp_logo, :text => 'OWASP Juice Shop')
  button(:shopping_cart, :aria_label => 'Show the shopping cart')
  
  def open_shopping_cart
  	shopping_cart
  end
end