module AUB
  module Payroll
    module SummaryFile
      extend ActiveSupport::Autoload

      autoload :Generator
      autoload :HTMLGenerator
      autoload :CompanyInfo
      autoload :PayrollInfo
      autoload :Transaction
      autoload :CustomPDFKit

      def self.generate(...)
        Generator.new(...).generate
      end

    end
  end
end
