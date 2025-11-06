
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

#-------------------------------------------------------------------------

#Average OBESITY BMI AGE : COUNTRY
BMI_AGE %>%
  group_by(location) %>%
  summarise(mean_obesity = mean(BMI_mean, na.rm = TRUE)) %>%
  arrange(desc(mean_obesity)) %>%
  ggplot(aes(x = reorder(location, mean_obesity), y = mean_obesity)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Obesity Prevalence by Country",
    x = "Country",
    y = "Mean Obesity Prevalence (%)"
  )


#Average OBESITY BMI AGE : SEX
BMI_AGE %>%
  group_by(sex) %>%
  summarise(mean_obesity = mean(BMI_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = sex, y = mean_obesity, fill = sex)) +
  geom_col() +
  labs(
    title = "Average Obesity Prevalence by Sex",
    x = "Sex",
    y = "Mean Obesity Prevalence (%)"
  )


#Average OBESITY BMI AGE : YEAR
BMI_AGE %>%
  group_by(year) %>%
  summarise(mean_obesity = mean(BMI_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_obesity)) +
  geom_line(color = "darkorange", size = 1) +
  geom_point(color = "red") +
  labs(
    title = "Global Trend of Obesity Over Time",
    x = "Year",
    y = "Mean Obesity Prevalence (%)"
  )


#Average OBESITY BMI AGE : YEAR & SEX (2 varable)
BMI_AGE %>%
  group_by(year, sex) %>%
  summarise(mean_obesity = mean(BMI_mean, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_obesity, color = sex)) +
  geom_line(size = 1) +
  geom_point() +
  labs(
    title = "Obesity Trend by Sex Over Time",
    x = "Year",
    y = "Mean Obesity Prevalence (%)",
    color = "Sex"
  )


#Countries with the Largest Changes in Obesity
BMI_change <- BMI_AGE %>%
  group_by(location) %>%
  summarise(
    first_year = min(year),
    last_year = max(year),
    obesity_start = BMI_mean[year == first_year],
    obesity_end = BMI_mean[year == last_year],
    change = obesity_end - obesity_start
  ) %>%
  arrange(desc(change))
head(BMI_change, 10)

#---------------------------------------------------------------------

# Grace code
# ---------------------------------------------------------------
# RELATIONSHIP BETWEEN RISK FACTORS
# ---------------------------------------------------------------

# Merge datasets by location, sex, and year
health_data <- BMI_AGE %>%
  inner_join(DIABETES, by = c("location", "sex", "year", "ISO")) %>%
  inner_join(CHOLESTEROL, by = c("location", "sex", "year", "ISO")) %>%
  inner_join(BLOOD_PRESSURE, by = c("location", "sex", "year", "ISO"))

# View structure
glimpse(health_data)

# ---------------------------------------------------------------
# CORRELATION ANALYSIS
# ---------------------------------------------------------------

# Select relevant numeric columns
cor_data <- health_data %>%
  select(BMI_mean_obesity, DIABETES_mean, CHOLESTEROL_mean, BP_mean)

# Compute correlation matrix
cor_matrix <- cor(cor_data, use = "complete.obs")

# Print correlation matrix
print(round(cor_matrix, 3))

# Visualize correlation matrix
library(reshape2)
library(ggplot2)

cor_melt <- melt(cor_matrix)
ggplot(cor_melt, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), color = "black") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  labs(title = "Correlation Matrix of NCD Risk Factors",
       x = "", y = "", fill = "Correlation") +
  theme_minimal()

# ---------------------------------------------------------------
# OBESITY VS OTHER RISK FACTORS
# ---------------------------------------------------------------

# Obesity vs Diabetes
ggplot(health_data, aes(x = BMI_mean_obesity, y = DIABETES_mean, color = sex)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Relationship Between Obesity and Diabetes Prevalence",
       x = "Obesity Prevalence (%)", y = "Diabetes Prevalence (%)")

# Obesity vs Cholesterol
ggplot(health_data, aes(x = BMI_mean_obesity, y = CHOLESTEROL_mean, color = sex)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Relationship Between Obesity and Cholesterol Levels",
       x = "Obesity Prevalence (%)", y = "Mean Total Cholesterol (mmol/L)")

# Obesity vs Blood Pressure
ggplot(health_data, aes(x = BMI_mean_obesity, y = BP_mean, color = sex)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Relationship Between Obesity and Blood Pressure",
       x = "Obesity Prevalence (%)", y = "Mean Systolic BP (mmHg)")


  
