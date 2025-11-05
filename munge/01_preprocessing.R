
# Load necessary packages
library(ProjectTemplate)
library(dplyr)
library(readr)

# --- Load Data ---
BLOOD_PRESSURE <- read_csv("data/NCD_RisC_Lancet_2017_BP_age_standardised_countries.csv")
BMI_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_age_standardised_country.csv")
BMI_CHILD_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_child_adolescent_country_ageStd.csv")
CHOLESTEROL <- read_csv("data/NCD_RisC_Lancet_2024_Diabetes_age_standardised_countries.csv")
DIABETES <- read_csv("data/NCD_RisC_Nature_2020_Cholesterol_age_standardised_countries.csv")

# --- Preprocessing ---
colnames(BLOOD_PRESSURE)
sum(is.na(BLOOD_PRESSURE_)) #to check is there any NA #result:0
colSums(is.na(BLOOD_PRESSURE_)) #to check in which column is the NA #result:0
library(dplyr)
library(readr)
BLOOD_PRESSURE <- read_csv("data/NCD_RisC_Lancet_2017_BP_age_standardised_countries.csv")
BLOOD_PRESSURE <- BLOOD_PRESSURE %>%
  filter(!is.na(`Mean systolic blood pressure (mmHg)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Mean systolic blood pressure (mmHg)`) %>%
  rename(
    location = `Country/Region/World`,
    sex = Sex,
    year = Year,
    BP_mean = `Mean systolic blood pressure (mmHg)`
  )
head(BLOOD_PRESSURE) #Displays the first 6 rows of the preprocessed dataset.

--------------------------------------------------------------------------
  
colnames(BMI_AGE)
sum(is.na(BMI_AGE))  #to check is there any NA #result:0 
colSums(is.na(BMI_AGE)) #to check in which column is the NA #result:0
library(dplyr)
library(readr)
BMI_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_age_standardised_country.csv")
BMI_AGE <- BMI_AGE %>% #OBESITY
  filter(!is.na(`Prevalence of BMI>=30 kg/m² (obesity)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Prevalence of BMI>=30 kg/m² (obesity)`) %>%
  rename(
    location = `Country/Region/World`,
    sex = Sex,
    year = Year,
    BMI_mean = `Prevalence of BMI>=30 kg/m² (obesity)`
  )
head(BMI_AGE) #Displays the first 6 rows of the preprocessed dataset.

library(dplyr)
library(readr)
BMI_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_age_standardised_country.csv")
BMI_AGE <- BMI_AGE %>% #UNDERWEIGHT
  filter(!is.na(`Prevalence of BMI<18.5 kg/m² (underweight)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Prevalence of BMI<18.5 kg/m² (underweight)`) %>%
  rename(
    location = `Country/Region/World`,
    sex = Sex,
    year = Year,
    BMI_mean = `Prevalence of BMI<18.5 kg/m² (underweight)`
  )
head(BMI_AGE) #Displays the first 6 rows of the preprocessed dataset.

----------------------------------------------------------------------------

colnames(BMI_CHILD_AGE)
sum(is.na(BMI_CHILD_AGE)) #to check is there any NA #result:0 
colSums(is.na(BMI_CHILD_AGE)) #to check in which column is the NA #result:0
library(dplyr)
library(readr)
BMI_CHILD_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_child_adolescent_country_ageStd.csv")
BMI_CHILD_AGE <- BMI_CHILD_AGE %>% #OBESITY
  filter(!is.na(`Prevalence of BMI > 2SD (obesity)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Prevalence of BMI > 2SD (obesity)`) %>%
  rename(
    location = `Country/Region/World`,
    BMI_child_mean = `Prevalence of BMI > 2SD (obesity)`
  )
head(BMI_CHILD_AGE) #Displays the first 6 rows of the preprocessed dataset.


library(dplyr)
library(readr)
BMI_CHILD_AGE <- read_csv("data/NCD_RisC_Lancet_2024_BMI_child_adolescent_country_ageStd.csv")
BMI_CHILD_AGE <- BMI_CHILD_AGE %>% #THINNESS
  filter(!is.na(`Prevalence of BMI < -2SD (thinness)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Prevalence of BMI < -2SD (thinness)`) %>%
  rename(
    location = `Country/Region/World`,
    BMI_child_mean = `Prevalence of BMI < -2SD (thinness)`
  )
head(BMI_CHILD_AGE) #Displays the first 6 rows of the preprocessed dataset.

----------------------------------------------------------------------------

colnames(CHOLESTEROL)
sum(is.na(CHOLESTEROL)) #to check is there any NA #result:0 
colSums(is.na(CHOLESTEROL)) #to check in which column is the NA #result:0
library(dplyr)
library(readr)
CHOLESTEROL <- read_csv("data/NCD_RisC_Nature_2020_Cholesterol_age_standardised_countries.csv")
CHOLESTEROL <- CHOLESTEROL %>%
  filter(!is.na(`Mean total cholesterol (mmol/L)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Mean total cholesterol (mmol/L)`) %>%
  rename(
    location = `Country/Region/World`,
    CHOLESTEROL_mean = `Mean total cholesterol (mmol/L)`
  )
head(CHOLESTEROL) #Displays the first 6 rows of the preprocessed dataset.

---------------------------------------------------------------------------

colnames(DIABETES)
sum(is.na(DIABETES)) #to check is there any NA #result:0 
colSums(is.na(DIABETES)) #to check in which column is the NA #result:0
library(dplyr)
library(readr)
DIABETES <- read_csv("data/NCD_RisC_Lancet_2024_Diabetes_age_standardised_countries.csv")
DIABETES <- DIABETES %>%
  filter(!is.na(`Prevalence of diabetes (18+ years)`)) %>%
  select(`Country/Region/World`, ISO, Sex, Year, `Prevalence of diabetes (18+ years)`) %>%
  rename(
    location = `Country/Region/World`,
    DIABETES_mean = `Prevalence of diabetes (18+ years)`
  )
head(CHOLESTEROL)