# frozen_string_literal: true

require_relative "../barcodes"

module Questionmark
  module Barcodes
    # We use our own internal prefix for "dummy" barcodes.
    # These can be longer than regular EAN13s, but that's fine for our internal use.
    # This custom GTIN class supports the length 19 ones as a named first class citizen.
    #
    # Questionmark-specific dummy barcodes
    # For documentation about our dummy barcodes, see our documentation:
    # @see doc/dummy-eans.md
    class DummyGTIN < BarcodeValidation::GTIN::Base
      # The fallback supports length 6+ so ensure we are evaluated first
      prioritize_before FallbackDummyGTIN

      VALID_LENGTH = 19
      # We actually have a few sub-prefixes that we can extract separate classes for:
      # This is length 13, and handled by QuestionmarkOldDummyGTIN:
      # - 9669 - old dummy barcode
      #
      # These are length 19, and handled here:
      # - 96690 - public dummy barcode
      # - 96691 - private dummy barcode
      # - 966999 - public dummy multiproduct barcode
      PREFIX = "9669"

      def self.handles?(input)
        input.start_with?(PREFIX) && input.length == VALID_LENGTH
      end

      def valid?
        self.class.handles?(input) && check_digit.valid?
      end
    end
  end
end
