require 'page-object'

class OWASPAccountPage 
  include PageObject
  
  span(:owasp_logo, :text => 'OWASP Juice Shop')
  button(:shopping_cart, :aria_label => 'Show the shopping cart')
  span(:basket_counter, :class => 'fa-layers-counter fa-layers-top-right fa-3x warn-notification')

end