require "aub/payroll/version"
require "active_support"
require "active_support/dependencies/autoload"
require "active_support/core_ext/enumerable"

module AUB
  module Payroll
    extend ActiveSupport::Autoload

    autoload :Errors
    autoload :EPFFile
  end
end
