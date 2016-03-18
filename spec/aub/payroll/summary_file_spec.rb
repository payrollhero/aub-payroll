require 'spec_helper'

describe AUB::Payroll::SummaryFile do
  describe '.generate' do

    let(:company_info) do
      {
        name: 'SomeCorp',
        account_number: '12345678',
        bank_branch: 'SomeBranch',
      }
    end

    let(:payroll_info) do
      {
        period_start: Date.new(2010,1,1),
        period_end: Date.new(2010,1,31),
        pay_date: Date.new(2010,2,5),
      }
    end

    let(:transactions) do
      [
        {
          employee_name: 'John Doe',
          account_number: '12345678',
          amount: 1235.45,
        }
      ]
    end

    example do
      pdf = described_class.generate(company_info: company_info, payroll_info: payroll_info, transactions: transactions)
      File.open('output.pdf', 'w') { |fh| fh.write(pdf) }
    end

  end
end
