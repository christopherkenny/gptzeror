#' Check or Get GPTZero API Key
#'
#' @return logical if `has`, key invisibly if `get`
#' @export
#'
#' @name key
#'
#' @concept key
#'
#' @examples
#' gptzero_has_key()
gptzero_has_key <- function() {
  Sys.getenv('GPTZero_KEY') != ''
}

#' @rdname key
#' @export
gptzero_get_key <- function() {
  key <- Sys.getenv('GPTZero_KEY')

  # if (key == '') {
  #   cli::cli_abort('Must set a key as {.val GPTZero_KEY}.')
  # }
  invisible(key)
}

#' Add GPTZero API key to .Renviron.
#'
#' @param key Character. API key to add to add.
#' @param overwrite Defaults to FALSE. Boolean. Should existing `GPTZero_KEY` in Renviron be overwritten?
#' @param install Defaults to FALSE. Boolean. Should this be added '~/.Renviron' file?
#'
#' @concept key
#'
#' @return key, invisibly
#' @export
#'
#' @examples
#' \dontrun{
#' gptzero_set_key('1234')
#' }
#'
gptzero_set_key <- function(key, overwrite = FALSE, install = FALSE) {
  if (missing(key)) {
    cli::cli_abort('Input {.arg key} cannot be missing.')
  }
  name <- 'GPTZero_KEY'

  key <- list(key)
  names(key) <- name

  if (install) {
    r_env <- file.path(Sys.getenv('HOME'), '.Renviron')

    if (!file.exists(r_env)) {
      file.create(r_env)
    }

    lines <- readLines(r_env)
    newline <- paste0(name, "='", key, "'")

    exists <- grepl(paste0(name, '='), x = lines)

    if (any(exists)) {
      if (sum(exists) > 1) {
        cli::cli_abort(c('Multiple entries in .Renviron found.',
                         'i' = 'Edit manually with {.fn usethis::edit_r_environ}.'
        ))
      }

      if (overwrite) {
        lines[exists] <- newline
        writeLines(lines, r_env)
        do.call(Sys.setenv, key)
      } else {
        cli::cli_inform('{.arg GPTZero_KEY} already exists in .Renviron.',
                        'i' = 'Edit manually with {.fn usethis::edit_r_environ} or set {.code overwrite = TRUE}.'
        )
      }
    } else {
      lines[length(lines) + 1] <- newline
      writeLines(lines, r_env)
      do.call(Sys.setenv, key)
    }
  } else {
    do.call(Sys.setenv, key)
  }

  invisible(key)
}
