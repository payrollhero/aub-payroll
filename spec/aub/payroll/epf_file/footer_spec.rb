require "spec_helper"

describe AUB::Payroll::EPFFile::Footer do
  subject(:footer) { described_class.new details }

  let(:string_version) { footer.to_s }

  let(:details) { { number_of_records: number_of_records, total_amount: total_amount } }
  let(:number_of_records) { 8 }
  let(:total_amount) { 7_173.75 }

  it { expect(string_version).to eq "EF000008000000007173.75000000000000000000000000000" }

  context "negative number of records" do
    let(:number_of_records) { -1 }

    it { expect { footer }.to raise_error AUB::Payroll::Errors::Invalid, "Number of records must be greater than 0" }
  end

  context "too many number of records" do
    let(:number_of_records) { 1_000_000 }

    it { expect { footer }.to raise_error AUB::Payroll::Errors::Invalid, "Number of records must be less than or equal to 999999" }
  end

  context "negative total amount" do
    let(:total_amount) { -0.01 }

    it { expect { footer }.to raise_error AUB::Payroll::Errors::Invalid, "Total amount must be greater than 0" }
  end

  context "too much total amount" do
    let(:total_amount) { 1_000_000_000_000.00 }

    it { expect { footer }.to raise_error AUB::Payroll::Errors::Invalid, "Total amount must be less than or equal to 999999999999.99" }
  end
end
