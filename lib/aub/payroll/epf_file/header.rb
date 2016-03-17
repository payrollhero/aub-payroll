require "active_model"

module AUB
  module Payroll
    class EPFFile::Header
      include ActiveModel::Model

      attr_accessor :company_name, :date

      validates :company_name, presence: true, length: { maximum: 40 }
      validates :date, presence: true

      # @param [String] company_name:
      # @param [Date] date:
      def initialize(*)
        super
        raise Errors::Invalid, errors.full_messages.to_sentence unless valid?
      end


      def to_s
        [
          "BF", # marks the beginning of file
          formatted_company_name,
          formatted_date,
        ].join
      end

      private

      def formatted_company_name
        String(company_name).upcase.ljust 40
      end

      def formatted_date
        date.strftime "%Y%m%d"
      end
    end
  end
end
