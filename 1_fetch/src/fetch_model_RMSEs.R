

library(sbtools)

fetch_data <- function(data_dir, data_fname, sb_id, names) {
  # Construct filepath
  dir.create(data_dir)
  mendota_file <- file.path(data_dir, data_fname)
  # Retrieve data
  item_file_download(sb_id, names = names, destinations = mendota_file, overwrite_file = TRUE)
}
