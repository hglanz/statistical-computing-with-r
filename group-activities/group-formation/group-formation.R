
library(tidyverse)
library(readxl)

set.seed(1234)

consent_forms <- read_csv(here::here("group-activities", 
                                     "group-formation", 
                                     "consent-form.csv")
                          ) |> 
  rename(full_name = `Please type your full name:`, 
         consent = Consent, 
         email = `Email Address`)

weeks2_3 <- read_csv(here::here("group-activities", 
                                "group-formation", 
                                "Weeks 2 & 3 Practice Activity Groups.csv")
                     )


yes <- filter(consent_forms,
              consent == "Yes, I agree to participate.") |> 
  pull(email)

yes_groups <- replicate(n = 4, 
                        sample(yes, size = 2, replace = FALSE)
) |> 
  as.data.frame() |> 
  rename(`Group 1` = V1, 
         `Group 2` = V2,
         `Group 3` = V3,
         `Group 4` = V4)

no <- filter(consent_forms,
              consent == "No, I do not agree to participate.") |> 
  pull(email)

no_groups <- replicate(n = 12, 
                       sample(no, size = 2, replace = FALSE)
                       ) |> 
  as.data.frame() |> 
  rename(`Group 5` = V1,
         `Group 6` = V2,
         `Group 7` = V3,
         `Group 8` = V4,
         `Group 9` = V5,
         `Group 10` = V6,
         `Group 11` = V7,
         `Group 12` = V8,
         `Group 13` = V9,
         `Group 14` = V10,
         `Group 15` = V11,
         `Group 16` = V12)



