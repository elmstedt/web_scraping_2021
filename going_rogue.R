library(jsonlite)
library(httr)

# Hidden API
# patrick mahomes id=11839
url <- "https://www.rotowire.com/football/player.php?id=11839"
(html <- read_html(url))
temp_file <- tempfile(fileext = ".html")
invisible(write_xml(html, temp_file))
# Open the HTML file in a browser
browseURL(paste('file://', temp_file, sep='/')) # sucks!

# but where do you get your information from?
url <- "https://www.rotowire.com/football/ajax/player-page-data.php?id=11839&pos=QB&team=GB&opp="
#
results_df <- lapply(fromJSON(url), `[[`, "body")
str(results_df)
results_list <- content(GET(url), as = "parsed")
str(results_list)


# Running page JavaScript
install.packages("V8")
library(V8)
url <- "https://www.mcxindia.com/market-data/spot-market-price"
(html <- read_html(url))
temp_file <- tempfile(fileext = ".html")
invisible(write_xml(html, temp_file))
# Open the HTML file in a browser
browseURL(paste('file://', temp_file, sep='/')) # sucks!

library(rvest)
library(stringi)
library(V8)

js <- html_nodes(html, xpath=".//script[contains(., 'Data')]")[[1]] %>%
  html_text() %>%
  gsub(pattern = "\\\\", replacement = "")

context <- v8()
context$eval(js)

keys <- context$get(JS("Object.keys(global)"))
keys
context$get("vSMP")[["Data"]]
