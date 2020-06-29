require 'page-object'

class OWASPProductCard 
  include PageObject
  
  div(:product, :class => 'product')
  button(:add_to_cart_btn, :aria_label => 'Add to Basket')
  
  def add_to_cart
    add_to_cart_btn
  end 
end