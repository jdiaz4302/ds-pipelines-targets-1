library(targets)

source('1_fetch/src/fetch_model_RMSEs.R')
source('2_process/src/process_model_RMSEs.R')
source('3_visualize/src/create_RMSE_figure1.R')
source('3_visualize/src/create_RMSE_table1.R')

tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))

list(
  # Get the data from ScienceBase
  tar_target(
    raw_data,
    fetch_and_load_data(out_fpath = "1_fetch/out/model_RMSEs.csv",
                        sb_id = "5d925066e4b0c4f70d0d0599",
                        sb_files = "me_RMSE.csv")
  ), 
  # Prepare the data for plotting and save it
  tar_target(
    eval_data,
    process_data(raw_data = raw_data,
                 out_fpath = "2_process/out/model_summary_results.csv"),
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    plot_RMSEs(eval_data = eval_data,
               out_fpath = "3_visualize/out/RMSE_figure.png")
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    tabularize_RMSEs(eval_data = eval_data,
                     out_fpath = "3_visualize/out/model_diagnostic_text.txt")
  )
)