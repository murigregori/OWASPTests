Feature: Customer Login in OWASP Juice Shop

Scenario: User successfully logs in to their account
  Given the user is in the OWASP Shop Home page
   When the user logs in with correct credentials
   Then the user should be logged in successfully to their account