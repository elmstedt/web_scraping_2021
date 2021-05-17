html <- read_html("https://coinmarketcap.com/")
html %>%
  html_table() # notice the name is bad. Also, we might want the link to the page

html %>%
  html_text2()
html %>%
  html_elements(xpath = "//table//a") %>%
  html_attr("href") %>%
  unique() %>%
  matrix(nrow = 2) %>%
  t()
