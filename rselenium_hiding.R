# Problem: The website can identify us!

library(RSelenium)

rd <- remoteDriver(remoteServerAddr = "127.0.0.1",
                   browserName = 'chrome',
                   port = 4445)
rd$open()
rd$executeScript("return navigator.webdriver;")
rd$executeScript("return eval.toString().length")
rd$executeScript("return navigator.userAgent;", list(""))
rd$navigate("http://stats20.com/webscraping/us_demo_wiki.html")
rd$screenshot(display = TRUE)
rd$close()

# You can optionally set a specific user agent, but this is not required
# ua <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36"
extra_caps <- list(chromeOptions = list(
  args = list("--disable-blink-features=AutomationControlled", # hides the webdriver
              # "--blink-settings=imagesEnabled=false", # don't load images
              "--disable-dev-shm-usage")#, # increase allowable memory to whatever is in your host system.
              # paste0("user-agent=", ua)), # change userAgent (not required)
  excludeSwitches = list("enable-automation") # removed the info bar
  ))

rd <- remoteDriver(remoteServerAddr = "127.0.0.1",
                   browserName = "chrome",
                   port = 4445,
                   extraCapabilities = extra_caps)
rd$open()
url <- "https://www.airbnb.com/rooms/45580200?check_in=2021-06-04&check_out=2021-06-21&federated_search_id=1098295d-d207-4bab-bef0-b6af34297505&source_impression_id=p3_1620336509_o9fXA%2FBIMLMhCzgu&guests=1&adults=1"
rd$navigate(url)
rd$executeScript("return navigator.webdriver;")
rd$executeScript("return eval.toString().length")
rd$executeScript("return navigator.userAgent;", list(""))
rd$executeScript("return navigator.platform;") # Note: the UA and platform are inconsistent, must use a platform which matches the UA
rd$navigate("http://stats20.com/webscraping/us_demo_wiki.html")
rd$screenshot(display = TRUE)
rd$close()
