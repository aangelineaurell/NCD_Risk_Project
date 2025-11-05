
library(ggplot2)
library(dplyr)


#Average blood pressure : COUNTRY
BLOOD_PRESSURE %>%
  group_by(location) %>%
  summarise(mean_BP = mean(BP_mean, na.rm = TRUE)) %>%
  arrange(desc(mean_BP)) %>%
  ggplot(aes(x = reorder(location, mean_BP), y = mean_BP)) +
  geom_col(fill = "firebrick") +
  coord_flip() +
  labs(
    title = "Average Systolic Blood Pressure by Country",
    x = "Country",
    y = "Mean Systolic BP (mmHg)"
  )


#Average blood pressure : SEX
BLOOD_PRESSURE %>%
  group_by(sex) %>%
  summarise(mean_BP = mean(BP_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = sex, y = mean_BP, fill = sex)) +
  geom_col() +
  labs(
    title = "Average Blood Pressure by Sex",
    x = "Sex",
    y = "Mean Systolic BP (mmHg)"
  )


#Average blood pressure : YEAR
BLOOD_PRESSURE %>%
  group_by(year) %>%
  summarise(mean_BP = mean(BP_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_BP)) +
  geom_line(color = "darkred", size = 1) +
  geom_point(color = "firebrick") +
  labs(
    title = "Trend of Mean Systolic Blood Pressure Over Time",
    x = "Year",
    y = "Mean Systolic BP (mmHg)"
  )


#Average blood pressure : YEAR & SEX (2 variable)
BLOOD_PRESSURE %>%
  group_by(year, sex) %>%
  summarise(mean_BP = mean(BP_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_BP, color = sex)) +
  geom_line(size = 1) +
  geom_point() +
  labs(
    title = "Blood Pressure Trend by Sex Over Time",
    x = "Year",
    y = "Mean Systolic BP (mmHg)",
    color = "Sex"
  )

