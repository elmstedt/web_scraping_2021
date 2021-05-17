my_url <- "https://en.wikipedia.org/wiki/Wikipedia:Multiyear_ranking_of_most_viewed_pages"
html <- read_html(my_url)
tabs <- html_table(html) # Note: Tables are unnamed!
length(tabs)
headline_xp <- "//*[@class=\"mw-headline\"]"
html %>%
  html_elements(xpath = headline_xp) %>%
  html_text()


tabs

# find table, go up then down to get the title
headline_xp <- "//*[@class=\"wikitable\"]/preceding-sibling::*[self::h1 or self::h2 or self::h3][1]//*[@class=\"mw-headline\"]"

html %>%
  html_elements(xpath = headline_xp) %>%
  html_text2() ->
  names(tabs)

tabs


