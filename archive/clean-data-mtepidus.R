library(dplyr)
library(readr)
library(lubridate)
library(stringr)

# Read the CSV, skipping the first row with headers
bee_data <- read_csv("datasheets/Bees.csv", skip = 1, 
                     col_names = c("Date", "Bee_color", "Nest_Number", "Time_Entered", "Time_Exited"))

# Parse Date column using lubridate::mdy()
bee_data <- bee_data %>%
  mutate(Date = mdy(Date))

# View result
bee_data %>% select(Date) %>% distinct()


# Define a helper function to add AM/PM
fix_ampm <- function(time_str) {
  time_str <- str_trim(time_str)
  if (is.na(time_str) || time_str == "") return(NA_character_)
  
  hour_val <- suppressWarnings(as.numeric(str_extract(time_str, "^[0-9]{1,2}")))
  if (is.na(hour_val)) return(NA_character_)
  
  if (hour_val >= 8 & hour_val <= 11) {
    return(paste0(time_str, " AM"))
  } else {
    return(paste0(time_str, " PM"))
  }
}

# Apply it to both time columns
bee_data <- bee_data %>%
  mutate(
    Time_Entered_fixed = sapply(Time_Entered, fix_ampm),
    Time_Exited_fixed  = sapply(Time_Exited, fix_ampm)
  )

# View result
bee_data %>% select(Date, Bee_color, Nest_Number, Time_Entered_fixed, Time_Exited_fixed)


#remove rows with NA and create dt for those witohout NA (will want to return them for determining how many nests a female enteres)
bee_data <- bee_data %>%
  filter(!is.na(Time_Entered_fixed) & !is.na(Time_Exited_fixed)) %>%
  mutate(
    Time_Entered_dt = parse_date_time(paste(Date, Time_Entered_fixed), orders = "ymd HM p"),
    Time_Exited_dt  = parse_date_time(paste(Date, Time_Exited_fixed), orders = "ymd HM p")
  )

bee_data <- bee_data %>%
  mutate(
    Duration_minutes = as.numeric(difftime(Time_Exited_dt, Time_Entered_dt, units = "mins"))
  )

# View result
bee_data %>%
  select(Date, Time_Entered_fixed, Time_Entered_dt, Time_Exited_fixed, Time_Exited_dt, Duration_minutes)
