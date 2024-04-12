## code to prepare `xkcd_data` dataset goes here

library(jsonlite)

json_objects <- vector(mode = "list", 10)
for (i in 1:10) {
  url <- file.path("https://xkcd.com", i, "info.0.json")
  #reading in urls
  json_objects[[i]] <- jsonlite::read_json(url)
  #saving url output in our json objects at specified positon
  Sys.sleep(1)
  #if using api as part of a script, sleeping for a min helps prevent hogging someones api
}

# want to put list into a big dataframe
xkcd <- do.call(rbind, json_objects)
# take big list coerce to data frame
xkcd_data <- as.data.frame(xkcd)

usethis::use_data(xkcd_data, overwrite = TRUE)
# taken a dataframe object and saved it to a file on our computer that only R knows how to open
