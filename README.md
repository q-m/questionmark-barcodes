# Questionmark::Barcodes

Questionmark::Barcodes (QM:B for short) was extracted from Questionmark-API in order to share our custom barcode logic between API and Hoard.

## Installation

Because this will be a privately hosted gem hosted on GitHub at first, installation instructions are a little different than usual. Add this to the application's `Gemfile`:

    gem 'questionmark-barcodes', github: 'q-m/questionmark-barcodes', tag: 'v0.1.0'

This pins the gem to a specific release, allowing us to continue updating the repository and create new releases periodically that projects can adopt at their own pace.

This project intends to follow Semantic Versioning. See details below at "Releasing a new version".

## Usage

QM:B provides an extension to the GTIN classes implemented by BarcodeValidation. Because of this, it works automatically:

```ruby
BarcodeValidation.scan("12345670") # => BarcodeValidation::GTIN::GTIN8
BarcodeValidation.scan("9669000000000") # => Questionmark::Barcodes::OldDummyGTIN
BarcodeValidation.scan("9669990132302229019") # => Questionmark::Barcodes::DummyGTIN
BarcodeValidation.scan("966999013200302000039007") # => Questionmark::Barcodes::FallbackDummyGTIN
```

As our custom GTINs start to offer more custom features, we'll add them here.

## Development

Useful commands after checking out the repo:

- `bin/setup` to install dependencies
- `rake spec` to run tests
- `rake rubocop` to run Rubocop, which checks the code style and may offer suggestions to improve the code
- `bin/console` for an interactive prompt that will allow you to experiment

We use GitHub for issues, pull requests and Continuous Integration. We don't publish our gem, but we do use version numbers for releases and tag them so our repositories can use code intended for release, rather than living on the bleeding edge.

## Releasing a new version

This project intends to follow [Semantic Versioning](https://semver.org/). This means the MAJOR version is incremented when we apply breaking changes. MINOR version increases are for new features that are backwards compatible. PATCH version increases are for backwards compatible bug fixes. While MAJOR version is ZERO, MINOR version signifies breaking/major changes and PATCH is incremented for all backwards compatible changes. Note that the stable branch on GitHub will be a work in progress, with unreleased changes.

- Check the [Changelog](./CHANGELOG.md) and ensure you've added a header for the new version + date that captures all unreleased changes.
- Update [version.rb](./lib/questionmark/barcodes/version.rb) to match this new version
- Run `bundle exec rake release` to create a commit + tag based on this, and push them to GitHub. We automatically set the ENV variable `gem_push=no` in our [Rakefile](./Rakefile) to ensure we don't push the gem to rubygems.org.

## Contributing

Bug reports and pull requests are welcome on GitHub at:

- [Issues](https://github.com/q-m/questionmark-barcodes/issues)
- [Pull requests](https://github.com/q-m/questionmark-barcodes/pulls)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
