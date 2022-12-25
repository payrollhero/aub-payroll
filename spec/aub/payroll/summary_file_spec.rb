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
        total: transactions.sum { |t| t[:amount] },
      }
    end

    let(:transactions) do
      [
        {
          employee_name: 'Doe, John',
          account_number: '12345678',
          amount: 1235.45,
        },
        {
          employee_name: 'Doe, Jane',
          account_number: '023463282',
          amount: 2315.23,
        },
      ] * 25
    end

    example do
      pdf = described_class.generate(company_info: company_info, payroll_info: payroll_info, transactions: transactions)
      expected_pdf = File.read("spec/fixtures/summary.pdf")
      expect(pdf).to have_same_pdf_appearance_as(expected_pdf)
    end

  end
end
