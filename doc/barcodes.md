# Barcodes

A barcode is a visual, machine-readable representation of data, typically using dots or lines. Most supermarket products have a 1D-barcode, consisting of parallel lines. The GS1 organisation hands out standardised barcodes that uniquely identify products, called [GTIN](https://en.wikipedia.org/wiki/Global_Trade_Item_Number)s; in Europe, we mostly have [EAN](https://en.wikipedia.org/wiki/International_Article_Number)s. The terms barcode, GTIN and EAN can be used interchangeably, unless otherwise noted.

At Questionmark, we're interested in user-identifiable products from the supermarket. This would be "Coca-Cola Zero 1L PET-bottle". Supermarkets talk about an SKU (stock keeping unit) for these products they are selling. But over time, the product formulation may change, so this Coca-Cola product may not be the same one year from now. The idea is that each unique product (with brand, ingredients, nutrients, and other label information) has a unique GTIN.

As we integrate data from various sources, the only way to do that reliably is to use the GTIN as linking key. So each product has a barcode at Questionmark.

Unfortunately there are supermarkets that don't use officially registered barcodes (usually starting with `2`), or for fresh products. But we still include them (even though there might be overlap). Sometimes we don't really know the barcode but know it is only sold in one supermarket as store-brand, in which case we'd assign our own internal dummy barcode (starting with `9669` - these are not meant to be exposed outside of Questionmark), [read more here](./dummy-eans.md).

## Partial barcodes

Most barcodes refer to a specific product in a package. For things like vegetables, fruits, cheese, each product can be slightly different in weight or size, and thus have a different price. This information can be encoded in a barcode as well.

We call this _partial barcodes_. To avoid storing all possible weight/price permutations of each type of fruit, we store them normalized, keeping only the "id" part. This allows us to look up information about a product regardless of price/weight info. Unfortunately, the way this is done is encoded in a somewhat country-specific way.

## Read more

* Blog post on [matching partial barcodes with SQL](http://developers.thequestionmark.org/2016/12/14/partial-barcode-sql), and its followup on [storing barcodes](http://developers.thequestionmark.org/2017/02/13/storing-barcodes)

## Standards

* [GS1 EAN/UPC](http://www.gs1.org/barcodes/ean-upc) (also at [GS1 NL](https://www.gs1.nl/aan-de-slag/gs1-barcodes/welke-soorten-gs1-codes-zijn))
