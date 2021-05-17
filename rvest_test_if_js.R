url <- "https://www.airbnb.com/rooms/45580200?check_in=2021-06-04&check_out=2021-06-21&federated_search_id=1098295d-d207-4bab-bef0-b6af34297505&source_impression_id=p3_1620336509_o9fXA%2FBIMLMhCzgu&guests=1&adults=1"
page <- read_html(url)

write_xml(page, file="this.html")
browseURL(paste("file://", getwd(),"this.html", sep="/"))

# xp <- "//*[@id=\"site-content\"]/div/div/div[1]/div[1]/div/div/div/div/section/div[2]/div[1]/span[1]/a/span"
# html %>%
#   html_element(xpath = xp)
