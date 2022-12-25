$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'aub/payroll'

require 'pdf_spec'

if ENV['WKHTMLTOPDF_CMD']
  AUB::Payroll.configure do |c|
    c.wkhtmltopdf_bin = ENV['WKHTMLTOPDF_CMD']
  end
end

RSpec.configure do |config|
  config.include(PdfSpec::Matchers)
end
