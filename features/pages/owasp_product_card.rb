require 'page-object'

class OWASPProductCard 
  include PageObject
  
  div(:product, :class => 'product')
  
  def add_to_cart(product)
  	msg = 'Placed ' + product + ' into basket.'
    apple_pomace_add_to_cart_btn = browser.element xpath: '/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-search-result/div/div/div[2]/mat-grid-list/div/mat-grid-tile[2]/figure/mat-card/div[2]/button'
    apple_pomace_add_to_cart_btn.click
    sleep 1
    @browser.span(:text => msg).present?
    sleep 2
  end

  def leave_review_for_product(product_name, review)
    product_name = browser.element text: product_name
    product_name.click
    product_review = @browser.textarea aria_label: 'Text field to review a product'
    product_review.click
    product_review.set review
    submit = browser.button id: 'submitButton'
    submit.click    
  end

   def view_review(review)
    snackbar = browser.element text: 'Your review has been saved'
    snackbar.present?
    reviews = browser.element text: 'Reviews'
    reviews.click
    my_review = browser.element text: review
    if(my_review.present?)
      return true
    else
      return false
    end    
  end

end