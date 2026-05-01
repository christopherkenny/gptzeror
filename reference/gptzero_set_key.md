# Add GPTZero API key to .Renviron.

Add GPTZero API key to .Renviron.

## Usage

``` r
gptzero_set_key(key, overwrite = FALSE, install = FALSE)
```

## Arguments

- key:

  Character. API key to add to add.

- overwrite:

  Defaults to FALSE. Boolean. Should existing `GPTZero_KEY` in Renviron
  be overwritten?

- install:

  Defaults to FALSE. Boolean. Should this be added '~/.Renviron' file?

## Value

key, invisibly

## Examples

``` r
if (FALSE) { # \dontrun{
gptzero_set_key('1234')
} # }
```
