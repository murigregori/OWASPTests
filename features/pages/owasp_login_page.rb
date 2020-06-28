require 'page-object'

class OWASPLoginPage 
  include PageObject
  
  div(:login_form, :text => 'login-form')
  text_field(:username, :id => 'email')
  text_field(:password, :id => 'password')
  button(:login_btn, :id => 'loginButton')
  
  def login(email, password)
    self.username = email
    self.password = password
    login_btn
  end
end