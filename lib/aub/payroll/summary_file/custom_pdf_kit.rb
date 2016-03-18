module AUB
  module Payroll
    module SummaryFile

      # just overriding executable so its easy to configure this for the gem directly
      class CustomPDFKit < PDFKit
        def executable
          AUB::Payroll.configuration.wkhtmltopdf_bin
        end
      end

    end
  end
end
