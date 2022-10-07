# frozen_string_literal: true

# Define the basic module structure everything else depends on.
module Questionmark
  module Barcodes
    class Error < StandardError; end
  end
end

require_relative "barcodes/version"

# This gem tightly integrates with BarcodeValidation and its internals
# Barcodevalidation defines a couple of GTINs, which are registered when the library is loaded.
require "barcodevalidation"

# We need to register our own custom classes in order for them to work.
# They are registered when loaded (inheritance based) so these requires are enough.
# They define their own relative priority.
require_relative "barcodes/old_dummy_gtin"
require_relative "barcodes/fallback_dummy_gtin"
require_relative "barcodes/dummy_gtin"
