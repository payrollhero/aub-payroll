require "active_model"

module AUB
  module Payroll
    class File::Row
      include ActiveModel::Model

      attr_accessor :account_number, :amount

      validates :account_number, presence: true, length: { is: 12 }
      validates :amount, numericality: { greater_than: 0, less_than_or_equal_to: 99_999_999_999.99 }

      # @param [String] account_number:
      # @param [BigDecimal] amount:
      def initialize(*)
        super
        raise Errors::Invalid, errors.full_messages.to_sentence unless valid?
      end


      def to_s
        [
          "01",
          account_number,
          formatted_amount,
          "0" * 22
        ].join
      end

      private

      def formatted_amount
        "%014.2f" % amount
      end
    end
  end
end
