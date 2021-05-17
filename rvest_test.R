library(rvest)
library(xml2)
url <- "https://en.wikipedia.org/wiki/List_of_people_who_have_lived_in_airports"
(html <- read_html(url))

# Let's see what rvest "sees"
# Write the HTML file back to disk:
temp_file <- tempfile(fileext = ".html")
invisible(write_xml(html, temp_file))
# Open the HTML file in a browser
browseURL(paste('file://', temp_file, sep='/'))

# If your data is there you can grab it with rvest. If not you'll need to be more clever!
