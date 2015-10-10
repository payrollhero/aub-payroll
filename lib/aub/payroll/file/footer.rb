require "active_model"

module AUB
  module Payroll
    class File::Footer
      include ActiveModel::Model

      attr_accessor :number_of_records, :total_amount

      validates :number_of_records, numericality: { greater_than: 0, less_than_or_equal_to: 999_999 }
      validates :total_amount, numericality: { greater_than: 0, less_than_or_equal_to: 999_999_999_999.99 }

      # @param [Integer] number_of_records:
      # @param [BigDecimal] total_amount:
      def initialize(*)
        super
        raise Errors::Invalid, errors.full_messages.to_sentence unless valid?
      end


      def to_s
        [
          "EF", # marks the end of file
          formatted_number_of_records,
          formatted_total_amount,
          "0" * 27,
        ].join
      end

      private

      def formatted_number_of_records
        "%06d" % number_of_records
      end

      def formatted_total_amount
        "%015.2f" % total_amount
      end
    end
  end
end
