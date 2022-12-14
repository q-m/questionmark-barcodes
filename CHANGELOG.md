## [Unreleased]

## [0.1.1] - 2022-11-11

The first _public_ release. Functionally unchanged from 0.1.0, but the documentation is friendlier.

- CI: trigger on pushes to `main` instead of `stable` ([#5](https://github.com/q-m/questionmark-barcodes/issues/5))
- CI: slightly changed name of task to indicate it's a CI task
- Doc: update descriptions to be more helpful for outside perspectives ([#7](https://github.com/q-m/questionmark-barcodes/issues/7))

## [0.1.0] - 2022-10-07

The initial release, offering feature parity with API's custom classes.

- Supply DummyGTIN, OldDummyGTIN and FallbackDummyGTIN as custom classes
- Added tests for all core BarcodeValidation GTIN classes and our own custom ones
- Added tests to prove GTINs with invalid check digit still parse as the correct class
