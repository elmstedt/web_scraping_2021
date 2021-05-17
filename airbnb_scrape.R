# big bear lake
# july 5 - july 15
# navigation or url hacking?
# url:
# https://www.airbnb.com/s/Big-Bear-Lake--CA--United-States/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&flexible_trip_dates%5B%5D=june&flexible_trip_dates%5B%5D=may&flexible_trip_lengths%5B%5D=weekend_trip&date_picker_type=calendar&query=Big%20Bear%20Lake%2C%20CA%2C%20United%20States&place_id=ChIJZYdwAomzxIARv1O7X3ZFbfQ&checkin=2021-07-05&checkout=2021-07-15&adults=2&disable_auto_translation=false&source=structured_search_input_header&search_type=autocomplete_click
# can be reduced to:
# https://www.airbnb.com/s/Big-Bear-Lake--CA--United-States/homes?place_id=ChIJZYdwAomzxIARv1O7X3ZFbfQ&checkin=2021-07-05&checkout=2021-07-15&adults=2

# get list of homes
# This link:
# https://www.airbnb.com/rooms/46697571?adults=2&check_in=2021-07-05&check_out=2021-07-15&previous_page_section_name=1000&federated_search_id=48dde619-f37d-4466-88e9-0165a143e6ac
# can get the same info with:
# https://www.airbnb.com/rooms/46697571
#
# Need to collect the list of "room ids"
# full xpath
# /html/body/div[4]/div/div[1]/div/div/div[1]/main/div/div[1]/div[1]/div[2]/div/div/div/div/div[3]/div/div/div/div/div[1]/div/div/div/div/div[2]
# <div> of interest:
# <div aria-labelledby="title_46697571" role="group" class="_8s3ctt">
# try class = "_8s3ctt"
# get "aria-labelledby" attribute
# extract numeric data or everything after "title_"
# move to next page
# shows 20 per page
# item_offset in url is how page is progressed:
# items_offset=20
