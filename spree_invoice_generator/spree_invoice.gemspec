# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_invoice/version"

Gem::Specification.new do |s|
  s.platform              = Gem::Platform::RUBY
  s.name                  = 'spree_invoice'
  s.version               = SpreeInvoice::VERSION
  s.summary               = 'Spree invoice PDF generation extension.'
  s.description           = 'This gem provides invoice pdf generation from a html template via wkhtmltopdf.'
  s.required_ruby_version = '>= 1.8.7'

  s.authors               = ['Damiano Giacomello', 'Peter Gębala', 'Thomas von Deyen']
  s.email                 = ['damiano.giacomello@diginess.it']
  s.homepage              = 'https://github.com/damianogiacomello/spree_invoice_generator'

  s.files                 = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'config/**/*']
  s.require_path          = 'lib'
  s.requirements          << 'wkhtmltopdf'

  s.add_dependency 'spree_core'
  s.add_dependency 'wicked_pdf'
  
  s.add_development_dependency 'rspec-rails'
end
