require "aub/payroll/version"
require "active_support"
require "active_support/dependencies/autoload"
require "active_support/core_ext/enumerable"

require 'pdfkit'
require 'ph_model'
require 'tilt'
require 'configurations'

module AUB
  module Payroll
    extend ActiveSupport::Autoload
    include Configurations

    configurable :wkhtmltopdf_bin

    configuration_defaults do |c|
      c.wkhtmltopdf_bin = 'wkhtmltopdf'
    end

    autoload :Errors
    autoload :EPFFile
    autoload :SummaryFile

    GEM_ROOT = File.expand_path(File.dirname(__FILE__) + '/../..')
  end
end
