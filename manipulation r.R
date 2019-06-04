#loading ggplot for plotting the graph
library(ggplot2)
#loading plyr for manipulation
library(plyr)
#taking texas housing as an example
head(txhousing)
#subsetting = selecting a particular data with specific condition
partial <- subset(txhousing,select = c('city','median','sales'))
head(partial, 2)
#selecting everything except city
partial <- subset(txhousing, select = -city)
head(partial, 5)
#selecting data from year to listings
partial <- subset(txhousing, select = year:listings)
head(partial, 3)
#removing rows and combining two data frames
partial <- subset(txhousing, year == 2000)
head(partial)
#selecting sales after the year 2000 for Houston
partial <- subset(txhousing, year > 2000 & city == 'Houston')
head(partial,2)
#selecting sales from houston or dallas
partial <- subset(txhousing, city == 'Houston' | city == 'Dallas')
head(partial,3)
#sorting the data, ascending or descending
sorted <- arrange(txhousing, year)
head(sorted)
#by descending order
sorted <- arrange(txhousing, desc(year), city)
head(sorted)
#adding columns
transformed <- transform(txhousing, total = volume*listings)
head(transformed)
#maximum and minimum
highest_year = max(subset(txhousing, select = year))
highest_year
#using $ method
highest_year1 <- max(txhousing$year)
#per each city showing the highest average price
grouped <- ddply(txhousing,c('city'),summarise,maxprice = max(median)) 
head(grouped)                     
