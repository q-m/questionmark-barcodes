# frozen_string_literal: true

RSpec.describe Questionmark::Barcodes do
  it "has a version number" do
    expect(Questionmark::Barcodes::VERSION).not_to be_nil
  end

  describe "BarcodeValidation extension" do
    # Valid GTINs and how we parse them
    {
      # Built-in GTINs from BarcodeValidation
      "12345670" => BarcodeValidation::GTIN::GTIN8,
      "123456789012" => BarcodeValidation::GTIN::GTIN12,
      "1234567890128" => BarcodeValidation::GTIN::GTIN13,
      "12345678901231" => BarcodeValidation::GTIN::GTIN14,
      # Our own custom GTINs
      # We started with length 13 custom GTINs
      "9669000000000" => Questionmark::Barcodes::OldDummyGTIN,
      # We have multiple types of length 19 dummy barcodes, based on their prefixes:
      # 96690* is a public dummy barcode
      "9669090132302229018" => Questionmark::Barcodes::DummyGTIN,
      # 96691* is a private dummy barcode
      "9669190132302229017" => Questionmark::Barcodes::DummyGTIN,
      # 966999* is a public dummy multi-product barcode
      "9669990132302229019" => Questionmark::Barcodes::DummyGTIN,
      # Any other 9669* GTIN of other lengths may have been unintentionally created, but is still supported this way
      "966999013200302000039007" => Questionmark::Barcodes::FallbackDummyGTIN
    }.each do |gtin, gtin_class|
      it "parses as #{gtin_class} when given valid GTIN #{gtin}" do
        parsed_gtin = BarcodeValidation.scan(gtin)
        expect(parsed_gtin.class).to eq(gtin_class)
        expect(parsed_gtin).to be_valid
      end

      # Transform our known valid GTINs to invalid ones in order to check they still parse to the correct class
      check_digit = gtin[-1, 1]
      wrong_check_digit = check_digit == "0" ? "9" : "0"
      invalid_gtin = gtin.dup
      invalid_gtin[-1, 1] = wrong_check_digit

      it "parses as #{gtin_class} when given invalid GTIN #{invalid_gtin}" do
        parsed_invalid_gtin = BarcodeValidation.scan(invalid_gtin)
        expect(parsed_invalid_gtin.class).to eq(gtin_class)
        expect(parsed_invalid_gtin).not_to be_valid
      end
    end
  end
end
