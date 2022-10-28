## [Unreleased]

- CI: trigger on pushes to `main` instead of `stable` ([#5](https://github.com/q-m/questionmark-barcodes/issues/5))
- CI: slightly changed name of task to indicate it's a CI task

## [0.1.0] - 2022-10-07

The initial release, offering feature parity with API's custom classes.

- Supply DummyGTIN, OldDummyGTIN and FallbackDummyGTIN as custom classes
- Added tests for all core BarcodeValidation GTIN classes and our own custom ones
- Added tests to prove GTINs with invalid check digit still parse as the correct class
