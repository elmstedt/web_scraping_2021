library(rvest)
library(xml2)

# One table
url <- "https://en.wikipedia.org/wiki/List_of_English_words_without_rhymes"
html <- read_html(url)

# gets one
li_xpath <- "//*[@id=\"mw-content-text\"]/div[1]/ul[1]/li[1]"

html %>%
  rvest::html_elements(xpath = li_xpath) %>%
  html_text()

# gets all
# look at the next item xpath and compare to the first
# //*[@id="mw-content-text"]/div[1]/ul[1]/li[1]
# //*[@id="mw-content-text"]/div[1]/ul[1]/li[2]
# notice the indexing difference, remove the index to collect all items
li_xpath <- "//*[@id=\"mw-content-text\"]/div[1]/ul[1]/li"
html %>%
  rvest::html_elements(xpath = li_xpath) %>%
  html_text()

# what about the other lists? Compare their xpaths to the first
# //*[@id="mw-content-text"]/div[1]/ul[1]/li[1]
# //*[@id="mw-content-text"]/div[1]/div[4]/ol/li[1]
# maybe we just grab all the list items?
li_xpath <- "//*/li"
html %>%
  rvest::html_elements(xpath = li_xpath) %>%
  html_text() ->
  all_items
str(all_items)

# we got some other stuff... try again!
li_xpath <- "//*[@id=\"mw-content-text\"]//*/li"
html %>%
  rvest::html_elements(xpath = li_xpath) %>%
  html_text() ->
  all_items
str(all_items)
# better!

# Try looking at the FULL xpaths and look at the TOC items too!
# TOC
# /html/body/div[4]/div[3]/div[5]/div[1]/div[2]/ul/li[1]
# Words with obscure perfect rhymes
# /html/body/div[4]/div[3]/div[5]/div[1]/ul[1]/li[1]
# Masculine rhymes
# /html/body/div[4]/div[3]/div[5]/div[1]/div[4]/ol/li[1]
# Feminine rhymes
# /html/body/div[4]/div[3]/div[5]/div[1]/div[5]/ol/li[1]
# See also
# /html/body/div[4]/div[3]/div[5]/div[1]/ul[2]/li
# Notes
# /html/body/div[4]/div[3]/div[5]/div[1]/div[6]/ol/li[1]
# External links
# /html/body/div[4]/div[3]/div[5]/div[1]/ul[3]/li

# We may need to choose based on class or id information too...
