
#number females per nest
bee_counts <- bee_data %>%
  filter(!is.na(Bee_color) & !is.na(Nest_Number)) %>%
  group_by(Nest_Number) %>%
  summarise(
    num_females = n_distinct(Bee_color),
    .groups = "drop"
  )

# View the result
bee_counts


total_nests <- nrow(bee_counts)
nests_with_multiple_females <- bee_counts %>%
  filter(num_females > 1) %>%
  nrow()

cat("Nests with >1 female:", nests_with_multiple_females, "out of", total_nests, "total nests\n")
