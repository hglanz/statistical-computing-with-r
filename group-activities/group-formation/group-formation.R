
library(tidyverse)
library(readxl)

set.seed(1234)

# Read in consent forms
consent_forms <- read_csv(here::here("group-activities", 
                                     "group-formation", 
                                     "consent-form.csv")
                          ) |> 
  rename(full_name = `Please type your full name:`, 
         consent = Consent, 
         email = `Email Address`) |> 
  mutate(consent = if_else(consent == "Yes, I agree to participate.", 
                           "Yes", 
                           "No")
         )

canvas_groups_week3 <- read_csv(here::here("group-activities", 
                                           "group-formation", 
                                           "canvas-group-template.csv")
                                )

## Form groups by shuffling within the Y / N consent groups
weeks_3_groups <- sample(consent_forms, 
                         replace = FALSE, 
                         groups = consent_forms$consent, 
                         orig.ids = FALSE) |> 
  mutate(group_name = c(
    rep("Group 1", 2),
    rep("Group 2", 2),
    rep("Group 3", 2),
    rep("Group 4", 2),
    rep("Group 5", 2),
    rep("Group 6", 2),
    rep("Group 7", 2),
    rep("Group 8", 2),
    rep("Group 9", 2),
    rep("Group 10", 2),
    rep("Group 11", 2),
    rep("Group 12", 2),
    rep("Group 13", 2),
    rep("Group 14", 2),
    rep("Group 15", 2),
    rep("Group 16", 2),
    rep("Group 17", 2),
    rep("Group 18", 2)
    )
    ) |> 
  # select only columns to join on
  select(email, 
         group_name)

final_canvas_groups_wk3 <- left_join(canvas_groups_week3, 
                                     weeks_3_groups, 
                                     by = join_by(login_id == email)
                                     ) |> 
  select(-group_name.x) |>
  rename(group_name = group_name.y)

write_csv(final_canvas_groups_wk3, 
          file = here::here("group-activities", 
                            "group-formation", 
                            "Week 4 Practice Activity Groups.csv")
          )  




