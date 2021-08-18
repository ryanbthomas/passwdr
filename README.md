
<!-- README.md is generated from README.Rmd. Please edit that file -->

# passwdr

<!-- badges: start -->
<!-- badges: end -->

Making It Easy to Make Better Passwords

![](https://imgs.xkcd.com/comics/password_strength.png) \# Goals

-   Use [EFF dice based algorithm](https://www.eff.org/dice) to generate
    high entropy passwords
-   Add helper functions to customize password to meet corporate
    password policies.
    -   must contain both upper/lower case letters
    -   must contain a number
    -   must contain special symbol
-   ability to render directly to clipboard to be pasted into password
    manager or other forms The goal of passwdr is to …

## Installation

You can install the released version of passwdr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("passwdr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("actuarialvoodoo/passwdr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(passwdr)
## basic example code
```
