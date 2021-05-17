url <- "https://www.airbnb.com/rooms/45580200?check_in=2021-06-04&check_out=2021-06-21&federated_search_id=1098295d-d207-4bab-bef0-b6af34297505&source_impression_id=p3_1620336509_o9fXA%2FBIMLMhCzgu&guests=1&adults=1"
url <- "https://www.airbnb.com/rooms/45580200/reviews?source_impression_id=p3_1620348655_2UhJi%2BSjwvGac%2FhG&guests=1&adults=1"
html <- read_html(url)
write_xml(html, file="this.html")
browseURL(paste('file://', getwd(),'this.html', sep='/'))
