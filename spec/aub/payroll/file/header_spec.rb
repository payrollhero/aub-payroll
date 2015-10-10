require "spec_helper"

describe AUB::Payroll::File::Header do
  subject(:header) { described_class.new details }

  let(:string_version) { header.to_s }

  let(:details) { { company_name: company_name, date: date } }
  let(:company_name) { "StyroPrints" }
  let(:date) { Date.new(2000, 6, 2) }

  it { expect(string_version).to eq "BFSTYROPRINTS                             20000602" }

  context "missing company name" do
    let(:company_name) { nil }

    it { expect { header }.to raise_error AUB::Payroll::Errors::Invalid, "Company name can't be blank" }
  end

  context "missing date" do
    let(:date) { nil }

    it { expect { header }.to raise_error AUB::Payroll::Errors::Invalid, "Date can't be blank" }
  end

  context "very long company name" do
    let(:company_name) { "VeryLong" * 100 }

    it {
      expect { header }.to raise_error(
        AUB::Payroll::Errors::Invalid, "Company name is too long (maximum is 40 characters)"
      )
    }
  end
end
