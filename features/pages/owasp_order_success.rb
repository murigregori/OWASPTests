require 'page-object'

class OWASPOrderSuccess
  include PageObject
  
  element(:text => 'Thank you for your purchase!')
  div(:delivery_details, :class => 'confirmation')
  element(:address_details, :xpath => '/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-order-completion/mat-card/div[1]/div/mat-card[2]/div/div[3]')
  element(:product_name, :xpath => '/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-order-completion/mat-card/div[2]/mat-table/mat-row/mat-cell[1]')
  element(:total_price, :xpath => '/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-order-completion/mat-card/div[2]/mat-table/mat-footer-row/mat-footer-cell[4]/table/tr[4]/td')

  def return_address
    return address_details
  end

  def return_delivery
    return delivery_details
  end

  def return_product
  	return product_name
  end

  def return_price
  	return total_price
  end
end