require 'spree_invoice'
require 'rails'

module SpreeInvoice
  class Railtie < Rails::Railtie
    rake_tasks do
      require '../tasks/spree_invoice.rake'
    end
  end
end
