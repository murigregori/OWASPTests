require 'page-object'

class OWASPAddressPage
  include PageObject
  
  button(:continue_to_delivery, :aria_label => 'Proceed to payment selection')
  button(:new_address, :aria_label => 'Add a new address')

  def pick_address(address)
  	picked_address = @browser.element text: address
  	picked_address.present?
    picked_address.click
    continue_to_delivery
  end
end