module AUB
  module Payroll
    module SummaryFile
      class Generator

        def initialize(company_info:, payroll_info:, transactions:)
          @company_info = CompanyInfo.build(company_info)
          @payroll_info = PayrollInfo.build(payroll_info)
          @transactions = transactions.map { |transaction| Transaction.build(transaction) }
        end

        def generate
          html_generator.generate do
            # wkhtmltopdf needs qt patches for header and footer options to work,
            # otherwise silently ignored, and the ubuntu package comes without it
            # that was the reason for static binary downloads in Docker
            kit = File.open('body.html', 'r') do |body_file|
              options = {
                page_size: 'Letter',
                header_html: 'header.html',
                footer_html: 'footer.html',
                margin_top: 38,
                margin_bottom: 5,
                margin_left: 0,
                margin_right: 0,
                enable_local_file_access: true,
              }
              CustomPDFKit.new(body_file, options)
            end
            kit.to_pdf
          end
        end

        def html_generator
          HTMLGenerator.new(company_info: @company_info, payroll_info: @payroll_info, transactions: @transactions)
        end
      end
    end
  end
end
