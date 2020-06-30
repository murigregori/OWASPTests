require 'page-object'

class OWASPProductCard 
  include PageObject
  
  div(:product, :class => 'product')
  button(:add_to_cart_btn, :aria_label => 'Add to Basket')
  
  def add_to_cart(product)
  	msg = 'Placed ' + product + ' into basket.'
    add_to_cart_btn
    sleep 1
    @browser.span(:text => msg).present?
    sleep 2
  end 
end