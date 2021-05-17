library(rvest)
library(xml2)
url <- "https://stats20.com/webscraping/us_demo_wiki.html"
page <- read_html(url)
# writeLines(as.character(page))
df <- html_table(page)
df

url <- "https://en.wikipedia.org/wiki/List_of_people_who_have_lived_in_airports"
page <- read_html(url)
df <- html_table(page)
df

# Data in multiple tables
url <- "https://en.wikipedia.org/wiki/Wikipedia:Unusual_place_names"
page <- read_html(url)
df <- html_table(page)

# combine into one table:
unusual_place_names <- Reduce(rbind, df[-1])



