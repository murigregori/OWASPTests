require 'page-object'

class OWASPDialog 
  include PageObject
  
  div(:welcome_dialog, :id => 'cdk-overlay-1')
  button(:dismiss, :aria_label => 'Close Welcome Banner')

  def dismiss_dialog
    dismiss
  end
end