install.packages(c("ProjectTemplate", "readxl", "dplyr"))
library(ProjectTemplate)
library(readxl)
library(dplyr)

create.project("NCD_Risk_Project")

library(readr)
BLOOD_PRESSURE_ <- read_csv("data/NCD_RisC_Lancet_2017_BP_age_standardised_countries.csv")
View(BLOOD_PRESSURE_)

library(readr)
BMI_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_age_standardised_country.csv")
View(BMI_AGE)

library(readr)
BMI_CHILD_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_child_adolescent_country_ageStd.csv")
View(BMI_CHILD_AGE)

library(readr)
CHOLESTEROL <- read_csv("data/NCD_RisC_Nature_2020_Cholesterol_age_standardised_countries.csv")
View(CHOLESTEROL)

library(readr)
DIABETES <- read_csv("data/NCD_RisC_Lancet_2024_Diabetes_age_standardised_countries.csv")
View(DIABETES)








library(dplyr)
BLOOD_PRESSURE_ <- read_csv("data/BLOOD PRESSURE .csv") #cleaning data
uk_data <- BLOOD_PRESSURE_ %>%
  filter(C`Country/Region/World` == "United Kingdom") #filter data for UK country