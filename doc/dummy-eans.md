# Dummy EANs

While barcodes are a central part of our infrastructure, so that we can relate products across data sources and supermarkets, there are cases when we want to include products that don't have a barcode. As an intermediate solution, we're giving certain products without an EAN an effective dummy EAN.

Barcode prefix `9669` is used as a Questionmark-specific barcode. It is a GS1 Global Office prefix, and until now not found on supermarkets products, and not likely to be in the future. Note that these barcodes _should not_ be communicated _outside_ Questionmark, since they are merely a tool to reduce complexity in Questionmark's systems. It is not GS1-compliant.

These are the current use-cases for dummy barcodes:

- Store-brand products only sold at one retailer without a barcode
- Products without a barcode for specific retailers that we want to process but don't expose publicly in the Questionmark API. This is a _private dummy EAN_.
- Multiproducts / product variants: some retailers give the same barcode to differents variants of the same product. We want to have them as separate entities. That's why we create a dummy barcode of the format `966999rrrbbbbbbbxxc`, which allows multiproduct barcodes of up to eight digits (incl. check digit) and ten product variants.

There are the following formats:

- `9669bbbbbbbbc` - old-style public dummy EAN13, used for store-brand products only.
- `96690bbbbbbbbbbbbbc` - public dummy EAN19: products are visible for all, EANs not.
- `96691bbbbbbbbbbbbbc` - private dummy EAN19: products are not visible outside of Questionmark.
- `966999rrrbbbbbbbxxc` - public dummy EAN19 for multiproducts / product variants.

We've encountered multiproduct dummy EANs longer than length 19 as well.
