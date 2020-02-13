df <- read.csv("studentdemographics2.csv")

df <- df %>% 
  mutate(
    BatesYear = case_when(
      BatesYear == 'Sophomore' ~ "2",
      BatesYear == 'Junior' ~ '3', 
      BatesYear == 'Senior' ~ '4',
    )
  )

