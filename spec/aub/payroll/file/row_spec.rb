require "spec_helper"

describe AUB::Payroll::File::Row do
  subject(:row) { described_class.new details }

  let(:string_version) { row.to_s }

  let(:details) { { account_number: account_number, amount: amount } }
  let(:account_number) { "001120001146" }
  let(:amount) { 540.00 }

  it { expect(string_version).to eq "0100112000114600000000540.000000000000000000000000" }

  context "invalid account number" do
    let(:account_number) { "1" }

    it { expect { row }.to raise_error AUB::Payroll::Errors::Invalid, "Account number is the wrong length (should be 12 characters)" }
  end

  context "negative amount" do
    let(:amount) { -0.01 }

    it { expect { row }.to raise_error AUB::Payroll::Errors::Invalid, "Amount must be greater than 0" }
  end

  context "too much amount" do
    let(:amount) { 100_000_000_000.00 }

    it { expect { row }.to raise_error AUB::Payroll::Errors::Invalid, "Amount must be less than or equal to 99999999999.99" }
  end
end
