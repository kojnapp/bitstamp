# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: bitstamp 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bitstamp".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeffrey Wilcke".freeze]
  s.date = "2017-09-21"
  s.description = "Ruby API for use with bitstamp.".freeze
  s.email = "stygeo@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".rspec",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bitstamp.gemspec",
    "lib/bitstamp.rb",
    "lib/bitstamp/collection.rb",
    "lib/bitstamp/helper.rb",
    "lib/bitstamp/model.rb",
    "lib/bitstamp/net.rb",
    "lib/bitstamp/orders.rb",
    "lib/bitstamp/ticker.rb",
    "lib/bitstamp/transactions.rb",
    "spec/bitstamp_spec.rb",
    "spec/collection_spec.rb",
    "spec/fixtures/vcr_cassettes/bitstamp/balance.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/order_book.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/orders/all.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/orders/buy.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/orders/sell/failure.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/ticker.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/transactions.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/unconfirmed_user_deposits.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/user_transactions/all.yml",
    "spec/fixtures/vcr_cassettes/bitstamp/withdraw_bitcoins/failure.yml",
    "spec/orders_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/bitstamp_setup.rb",
    "spec/support/vcr.rb",
    "spec/transactions_spec.rb"
  ]
  s.homepage = "http://github.com/kojnapp/bitstamp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Bitstamp Ruby API".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>.freeze, ["~> 4.2"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["~> 4.2"])
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<ruby-hmac>.freeze, ["= 0.4.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
    else
      s.add_dependency(%q<activemodel>.freeze, ["~> 4.2"])
      s.add_dependency(%q<activesupport>.freeze, ["~> 4.2"])
      s.add_dependency(%q<rest-client>.freeze, ["~> 1.8"])
      s.add_dependency(%q<ruby-hmac>.freeze, ["= 0.4.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
    end
  else
    s.add_dependency(%q<activemodel>.freeze, ["~> 4.2"])
    s.add_dependency(%q<activesupport>.freeze, ["~> 4.2"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 1.8"])
    s.add_dependency(%q<ruby-hmac>.freeze, ["= 0.4.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
  end
end

