co2_data <- read.csv("C:/Users/msl4e/Documents/info201/data/owid-co2-data.csv")

highest_country  <- co2_data %>% 
  group_by(country) %>% 
  summarize(co2_per_gdp = sum(co2_per_gdp, na.rm = TRUE)) %>% 
  filter(co2_per_gdp == max(co2_per_gdp), na.rm = TRUE) %>% 
  pull(country)

highest_year <- co2_data %>%
  group_by(year) %>% 
  summarize(co2_per_gdp = sum(co2_per_gdp, na.rm = TRUE)) %>% 
  filter(co2_per_gdp == max(co2_per_gdp), na.rm = TRUE) %>% 
  pull(year)

average_co2 <-co2_data %>% 
  group_by(country) %>% 
  summarize(new = mean(co2_per_gdp, na.rm = TRUE)) %>% 
  summarize(new1 = mean(new, na.rm = TRUE)) %>% 
  pull(new1)

df_graph <- co2_data %>% 
  group_by(country) %>% 
  summarize(co2_per_gdp = sum(co2_per_gdp, na.rm = TRUE)) %>% 
  pull(country)
View(df_graph)

years <- co2_data %>% 
  filter(year == year, na.rm = TRUE) %>% 
  filter(year == max(year), na.rm = TRUE) %>% 
  pull(year)


yearsmin <- co2_data %>% 
  filter(year == year, na.rm = TRUE) %>% 
  filter(year == min(year), na.rm = TRUE) %>% 
  pull(year)

# Copy the line below to make a slider bar 
sliderInput("slider1", label = h3("Slider"), min = 0, 
            max = 100, value = 50)
),
column(4,
       
       # Copy the line below to make a slider range 
       sliderInput("slider2", label = h3("Slider Range"), min = 0, 
                   max = 100, value = c(40, 60))








