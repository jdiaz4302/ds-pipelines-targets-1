

library(sbtools)

fetch_and_load_data <- function(out_fpath, sb_id, sb_files) {
  # Retrieve data
  item_file_download(sb_id, names = sb_files, destinations = out_fpath, overwrite_file = TRUE)
  return(out_fpath)
}
