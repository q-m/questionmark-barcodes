# frozen_string_literal: true

require_relative "../barcodes"

module Questionmark
  module Barcodes
    # We use our own internal prefix for "dummy" barcodes.
    # This custom GTIN class supports lengths that we don't explicitly know about,
    # such as the length 24 ones we've seen in specific cases.
    #
    # @see lib/questionmark_dummy_gtin.rb for a broader overview of all our dummy GTINs.
    class FallbackDummyGTIN < BarcodeValidation::GTIN::Base
      # This length is used for normalization but is _not_ the maximum we support.
      VALID_LENGTH = 19
      MIN_LENGTH = 6
      PREFIX = "9669"

      def self.handles?(input)
        input.start_with?(PREFIX) && input.length >= MIN_LENGTH
      end

      def valid?
        self.class.handles?(input) && check_digit.valid?
      end
    end
  end
end
