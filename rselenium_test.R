library(RSelenium)
rd <- remoteDriver(remoteServerAddr = "127.0.0.1",
                   browserName = 'chrome',
                   port = 4445)

rd$open()
rd$navigate("http://www.google.com")
rd$getTitle()
rd$screenshot(display = TRUE)
url <- "https://www.airbnb.com/"
url <- "https://www.airbnb.com/rooms/45580200?check_in=2021-06-04&check_out=2021-06-21&federated_search_id=1098295d-d207-4bab-bef0-b6af34297505&source_impression_id=p3_1620336509_o9fXA%2FBIMLMhCzgu&guests=1&adults=1"
rd$navigate(url)
rd$getTitle()
rd$screenshot(display = TRUE)
rd$close()
