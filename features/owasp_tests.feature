Feature: Happy Path for customer in OWASP Juice Shop

Background:
  Given the user is in the OWASP Shop Home page
   And the user logs in with correct credentials

Scenario: User successfully buys an item from the OWASP Juice Shop 
  Given the user has added "Apple Pomace" to the cart
   When the user checks out their cart
    And the user picks their address
    And the user picks their delivery option
    And the user pays with their OWASP wallet
   Then the user should see the order summary
    And the user should be notified that their order has been placed

Scenario: User leaves a review for a product in the OWASP Juice Shop
  Given the user is in the Home page
   When the user leaves a review for "Banana Juice (1000ml)"
   Then the user should see that the review has been posted