getwd()
library(tidyverse)
options(repr.matrix.max.rows=600, repr.matrix.max.cols=200) # setting all columns visible

dat <- read.csv("https://raw.githubusercontent.com/kyawmoeaung/mmclimate/master/FAOSTAT_data_12-31-2018%20(1).csv",
                sep = ",", stringsAsFactors = FALSE)
names(dat)
head(dat)

dat <- dat[, c("Area", "Element", "Item", "Year", "Unit", "Value")]
head(dat, 50)

library(dplyr)

dat %>% filter(Element == "Production")%>%
  arrange(Year)%>%
  ggplot(aes(x=Year, y=Value, fill = Value))+
  geom_col()
### Fertilizer Production by Type
dat %>% filter(Element == "Production")%>%
  arrange(Year)%>%
  ggplot(aes(x=Year, y=Value, fill = Item))+
  geom_col()+
  labs(x = "Year", y = "Tonnes",
       title = "Fertilizer Production in Myanmar (2002 - 2016)")
### Fertilizer Import by Type
dat %>% filter(Element == "Import Quantity")%>%
  arrange(Year)%>%
  ggplot(aes(x=Year, y=Value, fill = Item))+
  geom_col()+
  labs(x = "Year", y = "Tonnes",
       title = "Fertilizer Import in Myanmar (2002 - 2016)")
### Fertilizer Agricultural Use by type
dat %>% filter(Element == "Agricultural Use")%>%
  arrange(Year)%>%
  ggplot(aes(x=Year, y=Value, fill = Item))+
  geom_col()+
  labs(x = "Year", y = "Tonnes",
       title = "Fertilizer used by Agriculture Sector in Myanmar (2002 - 2016)")+
  theme(legend.position = "bottom")
