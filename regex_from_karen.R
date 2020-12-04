# extract file names from html source code
html_code <- getURLContent(base_url)
match_data <- gregexpr("(?<=<a href=\")(.+.txt)(?=\">)", html_code, perl = TRUE)
file_names <- unlist(regmatches(html_code, match_data))
file_urls <- paste0(base_url, file_names)

# download weather data files
file_paths = file.path(data_dir, file_names, fsep="")
# lapply(seq_along(file_urls), function(i) download.file(file_urls[i], file_paths[i]))

# extract district names from file names
file_list = list.files(path = data_dir, pattern = ".*txt")
match_data <- gregexpr("(.+)(?=_fldas_daily_[0-9]{8}-[0-9]{8}.txt)", file_list, perl = TRUE)
dist_list <- unlist(regmatches(file_list, match_data))

dist <- gsub("_", " ", substr(dist_list, 1, nchar(dist_list)-4))
prov <- substr(dist_list, nchar(dist_list)-2, nchar(dist_list))

read_file <- function(i) {                                    # read one file into data table
  dt <- fread(paste0("grep -v ^- ", data_dir, file_list[i]))  # grep -v excludes dashed lines
  dt[, ':=' (dist = dist[i], prov = prov[i])]                 # create district name variable
  return(dt)
}

# read in weather data files, combine into one file
data_list <- lapply(1:length(file_list), read_file)
weather_dt <- rbindlist(data_list, use.names=TRUE)