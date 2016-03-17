require "spec_helper"

describe AUB::Payroll::EPFFile do
  subject(:epf_file) {
    described_class.new company_name: company_name,
                        date: date,
                        transactions: transactions
  }

  let(:company_name) { "StyroPrints" }
  let(:date) { Date.new(2000, 6, 2) }

  let(:transactions) {
    [
      { account_number: "001120001146", amount: 540.00 },
      { account_number: "001120001146", amount: 921.00 },
      { account_number: "001120001146", amount: 816.25 },
      { account_number: "001120001146", amount: 500.00 },
      { account_number: "001120001146", amount: 882.50 },
      { account_number: "001120001146", amount: 857.50 },
      { account_number: "001120001146", amount: 1_044.00 },
      { account_number: "001120001146", amount: 1_612.50 }
    ]
  }

  let(:expected_file_content) { File.read "spec/fixtures/payroll.epf" }

  it { expect(epf_file.content).to eq expected_file_content }
end
