# Week 3 data viz assignment code

# Load Packages

library(tidyverse)
library(scales)
library(ggthemes)

# Import Data 

survey <- read_csv("survey.csv")
view(survey)

# Initial analysis

# I know this doesn't fully make sense on a real level because salaries are given in different currencies but I thought it'd be OK for now

survey |> 
  glimpse()

avg_annual_salary_by_gender <- survey |> 
  drop_na(gender) |> 
  drop_na(annual_salary) |> 
  group_by(gender) |> 
  summarize(avg_annual_salary = mean(annual_salary),
            n = n()) |> 
  arrange(avg_annual_salary) |> 
  view()

survey |> 
  drop_na(gender) |> 
  drop_na(industry) |> 
  group_by(gender) |> 
  summarize(industry) |> 
  view()

# Mapping average annual salary by gender 

ggplot(data = avg_annual_salary_by_gender,
       mapping = aes(x = avg_annual_salary,
                     y = gender, 
                     label = avg_annual_salary)) + 
  geom_col(fill = "#5560e2") +
  geom_text(hjust = 0.5) + 
  theme_minimal() +
  labs(title = "Average Annual Salary by Gender") +
  theme_few()
