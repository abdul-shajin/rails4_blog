Spree::Order.class_eval do
  has_one :invoice, :dependent => :destroy
  after_update :add_invoice

  #private
  def add_invoice
  	# Only create an invoice if the order is completed!
  	# And only create it if there is no invoice yet.
    self.create_invoice(user: user) if self.completed? && self.invoice.blank?
  end
end
