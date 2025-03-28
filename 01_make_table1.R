here::i_am("01_make_table1.R")

data<-readRDS(
  file = here::here("clean_data/data_clean.rds")
)

library(gtsummary)

table_one <- data %>% 
  select("region", "env_length", "ab_resistance", "number_glycans") %>% 
  tbl_summary(by = number_glycans) %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**PNGS in Glycan Shield") %>% 
  add_overall() %>% 
  add_p()

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)

print("I executed without any errors")