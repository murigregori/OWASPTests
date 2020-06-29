Feature: Happy Path for customer in OWASP Juice Shop

Background:
  Given the user is in the OWASP Shop Home page
   And the user logs in with correct credentials

Scenario: User successfully buys an item from the OWASP Juice Shop 
  Given the user has added an item to the cart
   When the user checks out their cart
    And the user picks their address
    And the user picks their delivery option
    And the user pays with their OWASP wallet
   Then the user should be notified that the item has been added to cart