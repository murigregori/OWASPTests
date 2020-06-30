require 'page-object'

class OWASPPaymentOptions
  include PageObject
  
  h1(:delivery_address_header, :text => 'My Payment Options')
  element(:card_payment, :id => 'mat-radio-51')
  element(:wallet_bal, :class => ["confirmation", "card-title"])
  button(:wallet_payment_btn, :class => ["mat-focus-indicator", "btn", "mat-raised-button", "mat-button-base", "mat-primary"])

  def payment_via_wallet
    wallet_payment_btn
  end

  def return_wallet_balance
    return wallet_bal
  end
end