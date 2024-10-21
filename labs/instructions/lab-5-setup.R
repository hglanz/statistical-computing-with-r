table_names <- c("crime_scene_report",
                 "drivers_license",
                 "facebook_event_checkin",
                 "get_fit_now_check_in",
                 "get_fit_now_member",
                 "income", 
                 "interview",
                 "person")

url_base <- "https://raw.githubusercontent.com/zoerehnberg/STAT331-S23/main/challenges/bCH_murder_data/"

# Function to paste the URL with the name of the table, 
# Store the resulting table in the Global Environment
read_in_tables <- function(x){ 
  assign(x, 
         value = readr::read_csv(
           str_flatten(url_base, x, ".csv")
           ), 
         envir = .GlobalEnv)
}

# For each name in the table names, read in the table and store it as the name.
purrr::walk(.x = table_names, 
            .f = read_in_tables)
