

library(sbtools)

fetch_data <- function(out_dir, out_fname, sb_id, sb_files) {
  # Construct filepath
  dir.create(out_dir)
  out_full_file_path <- file.path(out_dir, out_fname)
  # Retrieve data
  item_file_download(sb_id, names = sb_files, destinations = out_full_file_path, overwrite_file = TRUE)
}
