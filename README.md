# AUB::Payroll

[![Gem Version](https://badge.fury.io/rb/aub-payroll.svg)](http://badge.fury.io/rb/aub-payroll)
[![Code Climate](https://codeclimate.com/github/payrollhero/aub-payroll/badges/gpa.svg)](https://codeclimate.com/github/payrollhero/aub-payroll)
[![Build Status](https://travis-ci.org/payrollhero/aub-payroll.svg)](https://travis-ci.org/payrollhero/aub-payroll)

An AUB Payroll File Generator.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aub-payroll'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aub-payroll

## Usage

### Configuration

This gem uses wkhtmltopdf, it has been tested against version 0.12.3

If you'r wkhtmltopdf binary is different from the default, you can set it in the gem confuguration as follows:

```ruby
AUB::Payroll.configure do |c|
  c.wkhtmltopdf_bin = 'wkhtmltopdf-0.12.3'
end
```

### EPF Bank File

```ruby
  file = AUB::Payroll::EPFFile.new company_name: "StyroPrints",
                                   date: Date.new(2000, 6, 2),
                                   transactions: [
                                     { account_number: "001120001146", amount: 540.00 },
                                     { account_number: "001120001146", amount: 921.00 },
                                     { account_number: "001120001146", amount: 816.25 },
                                     { account_number: "001120001146", amount: 500.00 },
                                     { account_number: "001120001146", amount: 882.50 },
                                     { account_number: "001120001146", amount: 857.50 },
                                     { account_number: "001120001146", amount: 1_044.00 },
                                     { account_number: "001120001146", amount: 1_612.50 }
                                   ]
 
  File.write "payroll.epf", file.content
```

### Summary PDF File

```ruby
  company_info = {
    name: 'SomeCorp',
    account_number: '12345678',
    bank_branch: 'SomeBranch',
    address1: '123 some address',
    address2: '543 some more addresss',
    prepared_by_name_1: 'William Samson',
    prepared_by_name_2: 'Junior P. Santos',
    checked_by_name_1: 'Winnie Po',
    checked_by_name_2: 'Paul Sen',
  }

  transactions = [
    {
      employee_name: 'John Doe',
      account_number: '12345678',
      amount: 1235.45,
    }
  ] * 47 # ok fine, this is a repeating example, but you'd have real data here :)

  payroll_info = {
    period_start: Date.new(2010, 1, 1),
    period_end: Date.new(2010, 1, 31),
    pay_date: Date.new(2010, 2, 5),
    total: transactions.sum { |t| t[:amount] },
  }

  pdf = AUB::Payroll::SummaryFile.generate(company_info: company_info, payroll_info: payroll_info, transactions: transactions)
   
  File.write "summary.pdf", pdf
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/payrollhero/aub-payroll/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
