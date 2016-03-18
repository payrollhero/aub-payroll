module AUB
  module Payroll
    module SummaryFile
      class Transaction
        include PhModel

        attribute :employee_name
        attribute :amount
        attribute :account_number

        validates :employee_name, :amount, :account_number, presence: true

      end
    end
  end
end
