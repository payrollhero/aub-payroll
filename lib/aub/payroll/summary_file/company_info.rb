module AUB
  module Payroll
    module SummaryFile
      class CompanyInfo
        include PhModel

        attribute :name
        attribute :account_number
        attribute :address1
        attribute :address2
        attribute :bank_branch

        attribute :prepared_by_name_1
        attribute :prepared_by_name_2
        attribute :checked_by_name_1
        attribute :checked_by_name_2

        validates :name, :account_number, :bank_branch, presence: true

      end
    end
  end
end
