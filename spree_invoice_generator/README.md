SpreeInvoice
=======
This gem provides model responsible for generating pdf from html file.


Basic Installation
------------------

1. Add the following to your Gemfile
<pre>
  gem 'spree_invoice', '~> 1.1.0'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run:
<pre>
	rails g spree_invoice:install
</pre>


Configuration
-----

In file config/initializers/spree_invoice.rb please check your configuration for wkhtmltopdf bin path. 
For more see: [wicked_pdf](https://github.com/mileszs/wicked_pdf)


Usage
-----

1. Print Invoice directly
<pre>
	Spree::Invoice.find_by_order_id('some id').try(:generate_pdf)
</pre>
2. Print Invoice from order
<pre>
	Order.last.invoice.generate_pdf
</pre>
3. Print Invoice from User
<pre>
	pdfs = []
	User.last.invoices.each { |e| pdfs << e.generate_pdf }
</pre>

You can also check how many times invoice was generated - column: counter

Copyright (c) 2012 [Damiano Giacomello], released under the New BSD License
