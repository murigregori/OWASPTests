require 'page-object'

class OWASPBasketPage
  include PageObject

  button(:checkout_btn, :id => 'checkoutButton')
  element(:price, :id => 'price')

  def checkout
    checkout_btn
  end 

  def return_total
    return price
  end
end
