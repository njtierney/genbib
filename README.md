
<!-- README.md is generated from README.Rmd. Please edit that file -->

# genbib

<!-- badges: start -->

<!-- badges: end -->

The goal of genbib is to make it easier for me to generate bib files.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("njtierney/genbib")
```

## Example

``` r
library(genbib)
gen_bib_url(handle = "wikipedia",
            url = "https://en.wikipedia.org/wiki/Main_Page")
#> @misc{wikipedia,
#>  title = {wikipedia},
#>  howpublished = {https://en.wikipedia.org/wiki/Main_Page},
#>  note = {Accessed: 2019-05-11}
#> }
```
