

library("dplyr")
library("ggplot2")
library("scales")
library("readr")

rawData = read_csv("https://raw.githubusercontent.com/sebastianbarfort/sds/master/data/marijuana-street-price-clean.csv")

data <- tbl_df((rawData))
data <- select(data, -c(HighQN, MedQN, LowQN))


formatDateFunction <- function(tmpDate){
  tmpMonth <- format(tmpDate, format = "%B")
  tmpYear <- format(tmpDate, format = "%Y")
  (paste(tmpMonth, tmpYear, sep = "-"))
}

dataByMonth <- data %>% group_by(State, date())
data_MD <- filter(data, State=="Maryland")
data_MD <- arrange(data_MD, date)

rawData %>%
  group_by(State) %>%
  summarise(
    m.price = mean(HighQ, na.rm = TRUE)
  ) %>%
  arrange(desc(m.price))

p = ggplot(rawData, aes(x = date, y = HighQ))
p = p + geom_point(alpha = .05) # add points
p = p + geom_line() # add points
p = p + geom_smooth(colour = "red")
p = p + facet_wrap(~ State, scales = "free_y")
p = p + scale_x_date(breaks = pretty_breaks(4))
p = p + labs(x = NULL, y = "Price ($)", title = "Price of Marijuana")
