require 'spree_core'
require 'spree_invoice/engine'

module SpreeInvoice
  ## CONFIGURATION OPTIONS
  mattr_accessor :on_confirm_email
  @@on_confirm_email = true
  
  mattr_accessor :invoice_seller_details
  @@invoice_seller_details = nil
  
  mattr_accessor :invoice_seller_logo
  @@invoice_seller_logo = nil
  
  mattr_accessor :invoice_template_path
  @@invoice_template_path = "app/views/spree/invoices/invoice_template.html.erb"
  
  mattr_accessor :except_payment
  @@except_payment = ['Spree::PaymentMethod::Check']
  
  mattr_accessor :wkhtmltopdf_margin
  @@wkhtmltopdf_margin = {:top    => 10, :bottom => 10, :left   => 15, :right  => 15}
  
  mattr_accessor :invoice_number_generation_method
  @@invoice_number_generation_method = lambda { |next_invoice_count|
        number = "%04d" % next_invoice_count.to_s
        "R-#{Time.now.year}-#{number}"
  }
  
  def self.setup
    yield self
  end
end