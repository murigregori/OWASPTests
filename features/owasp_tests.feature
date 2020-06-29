Feature: Happy Path for customer in OWASP Juice Shop

Background:
  Given the user is in the OWASP Shop Home page
   And the user logs in with correct credentials

Scenario: User successfully buys an item from the OWASP Juice Shop 
  Given the user has added an item to the cart
   When the user checkouts their cart
    And the user pays for the item using their card
   Then the user should be notified that the item has been added to cart