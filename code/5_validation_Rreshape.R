library("data.table")
library("dplyr")
library("stringr")
library("haven")
library("tidyr")

# data_2019 <- as.data.table(read.csv("clean/reweighted_diy_2019_2.csv")) %>%
#   rename(ind_id=X)

data_2019 <- read.csv("clean/reweighted_diy_2019_2.csv") %>% 
  rename(ind_id=X) %>% 
  pivot_longer(starts_with("weights"), names_to = "id", values_to = "weights")

data_2019$id <- str_replace(data_2019$id, "weights", "")

fwrite(data_2019, "clean/reshaped_diy_2019_2.csv")

############

data_2020 <- read.csv("clean/reweighted_diy_2020_2.csv") %>% 
  rename(ind_id=X) %>% 
  pivot_longer(starts_with("weights"), names_to = "id", values_to = "weights")

data_2020$id <- str_replace(data_2020$id, "weights", "")

fwrite(data_2020, "clean/reshaped_diy_2020_2.csv")