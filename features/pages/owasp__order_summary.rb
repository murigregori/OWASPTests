require 'page-object'

class OWASPOrderSummary
  include PageObject
  
  element(:text => 'Order Summary')
  element(:total_price, :xpath => '/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-order-summary/mat-card/div[2]/mat-card/table/tr[4]/td[2]')
  button(:checkout_btn, :id => 'checkoutButton')

  def return_total_price
    return total_price
  end

  def checkout_order
    checkout_btn
  end
end