library(tidyverse)
Fdata <- read.csv("https://raw.githubusercontent.com/kyawmoeaung/mmclimate/master/FAOSTAT_data_ForestryProductNTrade.csv",
         sep = ",", header = TRUE, stringsAsFactors = FALSE)
names(Fdata)
 firedata <- Fdata %>% select("Area", "Element", "Item", "Year", "Unit", "Value") %>%
  filter(Item == "Wood fuel, non-coniferous (production)" | Item =="Wood fuel, coniferious (production)" |
           Item == "Wood fuel, all species (export/import)")
ggplot(Fdata, aes(x=Year, y = Value, fill = Item )) +
  geom_col() +
  theme(legend.position = "bottom")
ggplot(firedata, aes(x=Year, y = Value, fill = Item )) +
  geom_col() +
  labs(x = "Year", y = "Cubic meter", 
       title = "Fuel Wood Production in Myanmar 1960-2016")+
  theme(legend.position = "bottom")

unique(Fdata$Element)

Tdata <- Fdata %>% select("Area", "Year","Element", "Item", "Unit", "Value") %>%
  filter(Item == "Sawlogs and veneer logs, non-coniferous"|
           Item == "Other industrial roundwood, non-coniferous (production)")
  #arrange(desc(Value)) %>%
  ggplot(Tdata, aes(x = Year, y = Value, fill = Item))+
  geom_col()+
    theme(legend.position = "bottom")+
    labs(x = "Year", y = "Cubic meter",
         title = "Industrial roundwood and Sawlogs/ Veneer logs Production in Myanmar")

## Data extraction for Forest Prducts, Fuel wood and Industrial Roundwood
write.csv(Fdata, "Forest Products.csv", row.names = FALSE)
write.csv(firedata, "Fuelwood Consumption.csv", row.names = FALSE)
write.csv(Tdata, "Industrial Roundwood.csv", row.names = FALSE)
ggplot(Pdata, aes(x = Year, y = Value, fill = Element))+
  geom_col()

Pdata <- Fdata %>% 
  filter(Element == "Production" | Element == "Export Quantity" |
           Element == "Import Quantity")
ggplot(Pdata, aes(x = Year, y = Value, fill = Element))+
  geom_col()
#-----------------
Modis.FAO <- read.csv("https://raw.githubusercontent.com/kyawmoeaung/mmclimate/master/FAOSTAT_data_LandCover_MODIS.csv",
                     sep = ",", header = TRUE, stringsAsFactors = FALSE)
names(Modis.FAO)
Mdata <- Modis.FAO %>%
  select("Area", "Year", "Element", "Item", "Unit", "Value" )%>%
  filter(Year == 2010, !(is.na(Value)))
ggplot(Mdata, aes(x = Item, y = Value, fill = Item))+
  geom_col()+
  labs(x = "Land Cover/ Land Use", y = "Area in thousand Hectares",
       title = "Land Use/Land Cover data from MODIS in 2010") +
  theme(legend.position = "bottom")
