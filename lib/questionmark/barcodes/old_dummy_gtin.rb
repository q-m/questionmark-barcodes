# frozen_string_literal: true

require_relative "../barcodes"

module Questionmark
  module Barcodes
    # We use our own internal prefix for "dummy" barcodes.
    # This custom GTIN class supports our old length-13 dummy GTIN.
    #
    # @see lib/questionmark_dummy_gtin.rb for a broader overview of all our dummy GTINs.
    class OldDummyGTIN < BarcodeValidation::GTIN::Base
      # Any length 13 barcode will be evaluated by this before the default GTIN13, so prioritize it highly.
      prioritize_before BarcodeValidation::GTIN::GTIN13

      VALID_LENGTH = 13
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
