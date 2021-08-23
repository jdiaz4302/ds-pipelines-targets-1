

library(sbtools)

fetch_data <- function(data_dir = 'my_dir',
                       data_fname = 'model_RMSEs.csv',
                       sb_id = '5d925066e4b0c4f70d0d0599',
                       names = 'me_RMSE.csv') {
  # Construct filepath
  dir.create(data_dir)
  mendota_file <- file.path(data_dir, data_fname)
  # Retrieve data
  item_file_download(sb_id, names = names, destinations = mendota_file, overwrite_file = TRUE)
}
