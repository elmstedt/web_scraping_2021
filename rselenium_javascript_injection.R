library(RSelenium)
ua <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36"
extra_caps <- list(chromeOptions = list(
  args = list("--disable-blink-features=AutomationControlled", # hides the webdriver
              paste0("user-agent=", ua)), # change userAgent

  excludeSwitches = list("enable-automation") # removed the info bar
))

rd <- remoteDriver(remoteServerAddr = "127.0.0.1",
                   browserName = "chrome",
                   port = 4445,
                   extraCapabilities = extra_caps)
rd$open()
url <- "https://stats20.com/webscraping/gapminder_full/"
rd$navigate(url)
# add option
jscript <- "var sb = document.getElementsByName('DataTables_Table_0_length')[0];
var opt = document.createElement('option');
opt.appendChild(document.createTextNode('2000'));
opt.value = 2000;
sb.appendChild(opt);"
rd$executeScript(jscript)

# select option
option <- rd$findElement("xpath", "//*/option[@value = \"2000\"]")
option$clickElement()

# get page source and turn into nodelist
source <- rd$getPageSource()
html <- rvest::minimal_html(source)

# grab table with rvest
html %>%
  html_table() ->
  gap

rd$close()
