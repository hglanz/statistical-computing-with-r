table_names <- c("crime_scene_report","drivers_license",
                 "facebook_event_checkin",
                 "get_fit_now_check_in","get_fit_now_member",
                 "income", "interview","person")

url_base <- "https://raw.githubusercontent.com/zoerehnberg/STAT331-S23/main/challenges/bCH_murder_data/"

# For each name, read in the table and store it as the name.
purrr::walk(table_names, function(x) {
  assign(x, readr::read_csv(paste0(url_base, x, ".csv")), envir = .GlobalEnv)
})
