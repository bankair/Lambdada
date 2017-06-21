# encoding: utf-8

module Lambdada
  # This module holds the Lambdada version information.
  module Version
    STRING = '0.0.1'

    module_function

    def version(_debug = false)
      STRING
    end
  end
end
