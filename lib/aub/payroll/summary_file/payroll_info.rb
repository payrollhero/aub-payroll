module AUB
  module Payroll
    module SummaryFile
      class PayrollInfo
        include PhModel

        attribute :period_start
        attribute :period_end
        attribute :pay_date
        attribute :total

        validates :period_start, :period_end, :pay_date, presence: true
        validates :total, presence: true, numericality: true

      end
    end
  end
end
