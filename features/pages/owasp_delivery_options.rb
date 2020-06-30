require 'page-object'

class OWASPDeliveryOptions
  include PageObject
  
  h1(:delivery_address_header, :text => 'Delivery Address')
  h1(:delivery_speed_header, :text => 'Choose a delivery speed')
  div(:address, :text => @address)
  button(:continue_to_payment, :aria_label => 'Proceed to delivery method selection')


  def pick_delivery_speed(delivery)
  	delivery_option = @browser.element text: delivery
  	delivery_option.present?
    delivery_option.click
    continue_to_payment
  end
end