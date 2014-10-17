#!/bin/bash

# Label: JavaScript Console
# Description: Ensures JavaScript debug statements are removed.
function java_script_console() {
  local label="[java_script]"

  if command -v ag > /dev/null; then
    local results=()
    results="$(ag --file-search-regex '(js|erb|slim)' '^(?:(?!(.*//.+|.*/\*.+)).*console.log)' . || true)"

    if [[ ${#results[@]} > 0 && ${results[@]} != '' ]]; then
      printf "$label: Debug statements detected:\n\n"

      for line in ${results[@]}; do
        printf "$line\n"
      done

      exit 1
    fi
  else
     printf "$label: The Silver Surfer not found. To install, run: brew install the_silver_searcher."
     exit 1
  fi
}