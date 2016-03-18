$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'aub/payroll'
require 'pry'

AUB::Payroll.configure do |c|
  c.wkhtmltopdf_bin = 'wkhtmltopdf-0.12.3'
end

run -> (env) {

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
  ] * 47

  payroll_info = {
    period_start: Date.new(2010, 1, 1),
    period_end: Date.new(2010, 1, 31),
    pay_date: Date.new(2010, 2, 5),
    total: transactions.sum { |t| t[:amount] },
  }

  pdf = AUB::Payroll::SummaryFile.generate(company_info: company_info, payroll_info: payroll_info, transactions: transactions)

  [200, { 'Content-Type' => 'application/pdf' }, [pdf]]
}
