library(rvest)
library(xml2)

# One table
url <- "https://en.wikipedia.org/wiki/List_of_people_who_have_lived_in_airports"
html <- read_html(url)
html_table(html)

# All tables
url <- "https://en.wikipedia.org/wiki/Wikipedia:Multiyear_ranking_of_most_viewed_pages"
page <- read_html(url)
table_list <- html_table(page)

df <- table_list[[1]]
df[["Views in millions"]]

# Note: Tables are unnamed!
# We'll get the table names in a bit in 'complicated_xpath.R'
# file.edit("complicated_xpath.R")


# Simple page edit
url <- "https://www.basketball-reference.com/leagues/NBA_2021.html"
html <- read_html(url)
bb_tables <- html %>%
  html_table()
str(bb_tables)
# get all tables
temp_file <- tempfile(fileext = ".html")
temp_file
invisible(write_xml(html, temp_file))


# Open the HTML file in a browser
browseURL(paste("file://", temp_file, sep=""))


tabs <- html %>%
  html_table()
length(tabs) # Why only four tables!?


tabs <- html %>%
  gsub(pattern = "<!--|-->", replacement = "") %>%
  minimal_html() %>%
  html_table()
length(tabs)
tabs
# Alternately
# tabs <- html_elements(html, xpath="//*/comment()|//*/table") %>%
#   gsub(pattern = "<!--|-->", replacement = "") %>%
#   paste(collapse = "</br>") %>%
#   minimal_html() %>%
#   html_table()

