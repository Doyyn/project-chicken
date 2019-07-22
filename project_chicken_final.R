#last updated 2019 July 22nd
#project code by Doyeon Ku
#project_chicken

#load visualization library
library(ggplot2)
library(zoo)
library(lubridate)
library(scales)

#load data from June 2016 to Dec 2016
chicken1606.df <- read.csv("CALL_CHICKEN_1606MONTH.csv", header = TRUE)
chicken1607.df <- read.csv("CALL_CHICKEN_1607MONTH.csv", header = TRUE)
chicken1608.df <- read.csv("CALL_CHICKEN_1608MONTH.csv", header = TRUE)
chicken1609.df <- read.csv("CALL_CHICKEN_1609MONTH.csv", header = TRUE)
chicken1610.df <- read.csv("CALL_CHICKEN_1610MONTH.csv", header = TRUE)
chicken1611.df <- read.csv("CALL_CHICKEN_1611MONTH.csv", header = TRUE)
chicken1612.df <- read.csv("CALL_CHICKEN_1612MONTH.csv", header = TRUE)
chicken16.df <- do.call("rbind", list(chicken1606.df, chicken1607.df, chicken1608.df,
                                      chicken1609.df, chicken1610.df, chicken1611.df, chicken1612.df))

#load data from Jan 2017 to Dec 2017
chicken1701.df <- read.csv("CALL_CHICKEN_1701MONTH.csv", header = TRUE)
chicken1702.df <- read.csv("CALL_CHICKEN_1702MONTH.csv", header = TRUE)
chicken1703.df <- read.csv("CALL_CHICKEN_1703MONTH.csv", header = TRUE)
chicken1704.df <- read.csv("CALL_CHICKEN_1704MONTH.csv", header = TRUE)
chicken1705.df <- read.csv("CALL_CHICKEN_1705MONTH.csv", header = TRUE)
chicken1706.df <- read.csv("CALL_CHICKEN_1706MONTH.csv", header = TRUE)
chicken1707.df <- read.csv("CALL_CHICKEN_1707MONTH.csv", header = TRUE)
chicken1708.df <- read.csv("CALL_CHICKEN_1708MONTH.csv", header = TRUE)
chicken1709.df <- read.csv("CALL_CHICKEN_1709MONTH.csv", header = TRUE)
chicken1710.df <- read.csv("CALL_CHICKEN_1710MONTH.csv", header = TRUE)
chicken1711.df <- read.csv("CALL_CHICKEN_1711MONTH.csv", header = TRUE)
chicken1712.df <- read.csv("CALL_CHICKEN_1712MONTH.csv", header = TRUE)
chicken17.df <- do.call("rbind", list(chicken1701.df, chicken1702.df, chicken1703.df, chicken1704.df,
                                    chicken1705.df, chicken1706.df, chicken1707.df, chicken1708.df,
                                    chicken1709.df, chicken1710.df, chicken1711.df, chicken1712.df))

#load data from Jan 2018 to Nov 2018
chicken1801.df <- read.csv("CALL_CHICKEN_1801MONTH.csv", header = TRUE)
chicken1802.df <- read.csv("CALL_CHICKEN_1802MONTH.csv", header = TRUE)
chicken1803.df <- read.csv("CALL_CHICKEN_1803MONTH.csv", header = TRUE)
chicken1804.df <- read.csv("CALL_CHICKEN_1804MONTH.csv", header = TRUE)
chicken1805.df <- read.csv("CALL_CHICKEN_1805MONTH.csv", header = TRUE)
chicken1806.df <- read.csv("CALL_CHICKEN_1806MONTH.csv", header = TRUE)
chicken1807.df <- read.csv("CALL_CHICKEN_1807MONTH.csv", header = TRUE)
chicken1808.df <- read.csv("CALL_CHICKEN_1808MONTH.csv", header = TRUE)
chicken1809.df <- read.csv("CALL_CHICKEN_1809MONTH.csv", header = TRUE)
chicken1810.df <- read.csv("CALL_CHICKEN_1810MONTH.csv", header = TRUE)
chicken1811.df <- read.csv("CALL_CHICKEN_1811MONTH.csv", header = TRUE)
#chicken1812.df <- read.csv("CALL_CHICKEN_1812MONTH.csv", header = TRUE)
chicken18.df <- do.call("rbind", list(chicken1801.df, chicken1802.df, chicken1803.df, chicken1804.df,
                                    chicken1805.df, chicken1806.df, chicken1807.df, chicken1808.df,
                                    chicken1809.df, chicken1810.df, chicken1811.df))

#select the areas that area near Han Rivers
#여의도동, 반포동, 잠원동, 자양동, 잠실동, 암사동, 이촌동, 망원동, 상암동, 방화동, 당산동, 당산동 6가, 당산동 3가
near.river16 <- subset(chicken16.df, 읍면동=="여의도동"|읍면동=="반포동"|읍면동=="잠원동"|읍면동=="자양동"|
                         읍면동=="잠실동"|읍면동=="암사동"|읍면동=="이촌동"|읍면동=="망원동"|
                         읍면동=="상암동"|읍면동=="=방화동"|읍면동=="당산동"|읍면동=="당산동3가"|
                         읍면동=="당산동6가", select=c(기준일, 요일, 통화건수))

near.river17 <- subset(chicken17.df, 읍면동=="여의도동"|읍면동=="반포동"|읍면동=="잠원동"|읍면동=="자양동"|
                        읍면동=="잠실동"|읍면동=="암사동"|읍면동=="이촌동"|읍면동=="망원동"|
                        읍면동=="상암동"|읍면동=="=방화동"|읍면동=="당산동"|읍면동=="당산동3가"|
                        읍면동=="당산동6가", select=c(기준일, 요일, 통화건수))
#2018
near.river18 <- subset(chicken18.df, 읍면동=="여의도동"|읍면동=="반포동"|읍면동=="잠원동"|읍면동=="자양동"|
                         읍면동=="잠실동"|읍면동=="암사동"|읍면동=="이촌동"|읍면동=="망원동"|
                         읍면동=="상암동"|읍면동=="=방화동"|읍면동=="당산동"|읍면동=="당산동3가"|
                         읍면동=="당산동6가", select=c(기준일, 요일, 통화건수))


#time series plot - day & month
#change dates format
#2016
near.river16$기준일<- as.character(near.river16$기준일)
near.river16[["기준일"]] <- as.Date(near.river16[["기준일"]],format="%Y%m%d")
#2017
near.river17$기준일<- as.character(near.river17$기준일)
near.river17[["기준일"]] <- as.Date(near.river17[["기준일"]],format="%Y%m%d")
#2018
near.river18$기준일<- as.character(near.river18$기준일)
near.river18[["기준일"]] <- as.Date(near.river18[["기준일"]],format="%Y%m%d")

#combine 2017 and 2018 data, make day as a separate column
near.river<- rbind(near.river16, near.river17)
near.river<- rbind(near.river, near.river18)

#change col name
#기준일, 요일, 통화건수
names(near.river) <- c("yymmdd", "weekday", "calls")

#weekday name to integers
near.river$weekday <- factor(near.river$weekday, levels = c("월", "화", "수", 
                                                            "목", "금", "토", "일"),
                             ordered = TRUE)
near.river$weekday <- as.integer(near.river$weekday) #1=월, 7=일


#sum all the calls in each day
#near.river.daysum <-aggregate(x =list(calls=near.river$calls), by=list(yymmdd = near.river$yymmdd), FUN=sum)
#near.river.daysum$year<- substr(near.river.daysum$기준일, 1, 4)
#near.river.daysum$date <- substr(near.river.daysum$기준일, 6, 10)

#data visualization---------------------------------------------------------------------
#draw monthly plot 
#2016
near.river16.monthsum <-aggregate(x =list(통화건수=near.river16$통화건수), by=list(month=substr(near.river16$기준일, 1, 7)), FUN=sum)
names(near.river16.monthsum) <- c("yymm","calls")
#1~5월 데이터 보충
yymm <- c("2016-01", "2016-02", "2016-03","2016-04","2016-05")
calls <- c(NA, NA, NA, NA, NA)
de.df <- data.frame(yymm, calls)
near.river16.monthsum <- rbind(near.river16.monthsum, de.df)
#2017
near.river17.monthsum <-aggregate(x =list(통화건수=near.river17$통화건수), by=list(month=substr(near.river17$기준일, 1, 7)), FUN=sum)
names(near.river17.monthsum) <- c("yymm","calls")
#2018
near.river18.monthsum <-aggregate(x =list(통화건수=near.river18$통화건수), by=list(month=substr(near.river18$기준일, 1, 7)), FUN=sum)
names(near.river18.monthsum) <- c("yymm","calls")
#12월 데이터 보충
yymm <- c("2018-12")
calls <- c(NA)
de.df <- data.frame(yymm, calls)
near.river18.monthsum <- rbind(near.river18.monthsum, de.df)

near.river.monthsum <- rbind(near.river16.monthsum, near.river17.monthsum) 
near.river.monthsum <- rbind(near.river.monthsum, near.river18.monthsum)
#near.river.monthsum$yymm <- as.Date(near.river.monthsum$yymm)

#draw monthly plot for 2 years in linear way
near.river.monthsum$year<- substr(near.river.monthsum$yymm, 1, 4)
near.river.monthsum$month <- substr(near.river.monthsum$yymm, 6, 7)
#jpeg("0602_Monthly Calls from June 2016 to Nov 2018.jpeg", width = 10, height = 5, units = 'in', res = 300)
ggplot(near.river.monthsum, aes(x = month, y = calls, group=year)) +
  geom_line(aes(color=year))+
  geom_point(aes(color=year))+
  xlab("Month") + ylab("Monthly Calls Sum Near Han River") +
  ggtitle("Monthly Calls from June 2016 to Nov 2018")+
  scale_y_continuous(labels = comma)+
  coord_cartesian(ylim = c(10000, 40000))+
  theme_classic() +
  theme(plot.title = element_text(size=14, face="bold", hjust = 0.5))
#dev.off()

#time series plot - 요일
near.river$year <- substr(near.river$yymmdd, 1, 4)
near.river$year <- factor(near.river$year)
near.river.weeksum <-aggregate(x =list(calls=near.river$calls), by=list(weekday=near.river$weekday, year=near.river$year), FUN=sum) 

#jpeg("0602_Weekday Calls from June 2016 to Nov 2018.jpeg", width = 10, height = 5, units = 'in', res = 300)
ggplot(near.river.weeksum, aes(x = weekday, y = calls)) + 
  geom_line(aes(color=year)) + 
  geom_point(aes(color=year))+
  ggtitle("Weekday Calls, from June 2016 to Nov 2018")+ 
  xlab("Weekdays (1:Monday to 7:Sunday)") + ylab("Calls in Weekdays")+
  theme_classic() +
  scale_x_continuous(breaks = near.river.weeksum$weekday)+
  coord_cartesian(ylim = c(0, 60000))+
  theme(plot.title = element_text(size=14, face="bold", hjust = 0.5))
#dev.off()


#-----------------------------------------------------------------------------------------
#weather ---------------------------------------------------------------------------------
#load data
weather16.df <- read.csv("SEOUL_WEATHER_2016_june.csv", header = TRUE)
weather17.df <- read.csv("SEOUL_WEATHER_2017_modified.csv", header = TRUE)
weather18.df <- read.csv("SEOUL_WEATHER_2018_nov.csv", header = TRUE)
weather19.df <- read.csv("SEOUL_WEATHER_2019.csv", header = TRUE)

#dim(weather17.df)  #find the dimension of data
#head(weather17.df) #show the first six rows

#select the representative data - 종로
#관측일자, 지점명,평균기온(℃),최저기온(℃),최대기온(℃),평균습도(%),최저습도(%),최고습도(%),
#평균풍속(m/s),최대풍속(m/s),강수량(mm))
#관측일자,지점명,평균기온,최저기온, 최대기온,평균습도,최저습도,최고습도, 평균풍속,최대풍속,강수량
#2016 (June ~ Dec)
seoul.weather16<- subset(weather16.df, 지점명=="중구", select=c(관측일자,최저기온,
                                                               최대기온,강수량))
#2017 (Jan ~ Dec)
seoul.weather17<- subset(weather17.df, 지점명=="중구", select=c(관측일자,최저기온,
                                                                최대기온,강수량))
#2018 (Jan ~ Nov)
seoul.weather18<- subset(weather18.df, 지점명=="중구", select=c(관측일자,최저기온,
                                                                최대기온,강수량))
#2019 (June ~ Aug) for forecase (forecasted weather data)
seoul.weather19<- subset(weather19.df, 지점명=="중구", select=c(관측일자,최저기온,
                                                               최대기온,강수량))

head(seoul.weather19)

#change dates format
#2017
seoul.weather16$관측일자<- as.character(seoul.weather16$관측일자)
seoul.weather16[["관측일자"]] <- as.Date(seoul.weather16[["관측일자"]],format="%Y%m%d")
#2017
seoul.weather17$관측일자<- as.character(seoul.weather17$관측일자)
seoul.weather17[["관측일자"]] <- as.Date(seoul.weather17[["관측일자"]],format="%Y%m%d")
#2018
seoul.weather18$관측일자<- as.character(seoul.weather18$관측일자)
seoul.weather18[["관측일자"]] <- as.Date(seoul.weather18[["관측일자"]],format="%Y%m%d")
#2019 for forecast (forecasted weather data)
seoul.weather19$관측일자<- as.character(seoul.weather19$관측일자)
seoul.weather19[["관측일자"]] <- as.Date(seoul.weather19[["관측일자"]],format="%Y%m%d")


#combine 2017 2018 data, divide year and month as a separate variable-----------------
#data for modeling
seoul.weather<- rbind(seoul.weather16, seoul.weather17)
seoul.weather<- rbind(seoul.weather, seoul.weather18)

#관측일자, 지점명, 최저기온, 최대기온, 강수량
names(seoul.weather) <- c("yymmdd", "mintemp", "maxtemp","prec")

#seoul.weather.sum<-aggregate(x =list(통화건수=near.river$통화건수), by=list(기준일 = substr(near.river$기준일, 1, 7)), FUN=avg)


#weather and calls in one dataframe-------------------------------------------------
#combine weather and calls in one data frame by date
#preprocess
near.river.daysum <-aggregate(x =list(calls=near.river$calls), by=list(yymmdd = near.river$yymmdd), FUN=sum)
near.river.daysum <-merge(near.river.daysum, near.river[,c("yymmdd", "weekday")], by="yymmdd", all =FALSE)
near.river.daysum <-near.river.daysum[!duplicated(near.river.daysum), ]

#combine by date
seoul.weather$yymmdd=as.Date(seoul.weather$yymmdd, "%Y%m%d")
near.river.daysum$yymmdd=as.Date(near.river.daysum$yymmdd, "%Y%m%d")
weather.and.call<-merge(seoul.weather, near.river.daysum, by="yymmdd", all=TRUE)

#add year, month, date (to use date as a predictor later on)
#weather.and.call$year<- substr(weather.and.call$기준일, 1, 4) #add year
#weather.and.call$date <- substr(weather.and.call$기준일, 6, 10) #add date
#weather.and.call <- subset(weather.and.call, select=-c(date)) #delete date
#weather.and.call <-merge(weather.and.call, near.river[,c("기준일", "weekday")], by="기준일", all =FALSE)
#weather.and.call<-weather.and.call[!duplicated(weather.and.call), ]
weather.and.call.nona<-na.omit(weather.and.call)


#lets do prediction ----------------------------------------------------------
#add libraries
library(caret)
library(lattice)
library(gains)
library(e1071)
library(forecast)
library(rpart)
library(rpart.plot)

#original value plot
#jpeg("0601_Daily Calls from June 2016 to Nov 2018.jpeg", width = 8, height = 5, units = 'in', res = 300)
ggplot(weather.and.call.nona, aes(weather.and.call.nona$yymmdd, weather.and.call.nona$calls)) +
  geom_line() +
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.minor = element_line(colour = "grey90"),
        panel.grid.major = element_line(colour = "grey90"),
        panel.grid.major.x = element_line(colour = "grey90"),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = "bold"),
        plot.title = element_text(size = 12, face = "bold")) +
  labs(x = "Date", y = "Daily Calls", title = "Daily Calls from June 2016 to Nov 2018")
#dev.off()

#partition the data
set.seed(5)  
train.index <- sample(c(1:dim(weather.and.call.nona)[1]),    
                      dim(weather.and.call.nona)[1]*0.6)  
train.df <- weather.and.call.nona[train.index, ]
valid.df <- weather.and.call.nona[-train.index, ]

#multiple linear regression without eliminating outliers---------------------------------------------
#fitting linear model
call.lm <- lm(calls ~ ., data = train.df, na.action=na.omit)

#model summary
options(scipen = 999)
summary(call.lm)

smmr.lm <- summary(call.lm)
paste("R-squared: ",
      round(smmr.lm$r.squared, 3),
      ", p-value of F test: ",
      1-pf(smmr.lm$fstatistic[1], smmr.lm$fstatistic[2], smmr.lm$fstatistic[3]))


#compare prediction model with original data
part.datas <-cbind(weather.and.call.nona[,c("calls", "yymmdd")], type="Real")
part.datas.2 <-cbind(data.frame(calls = call.lm$fitted.values, yymmdd = weather.and.call.nona[train.index, "yymmdd"]), type="Fitted")
datas <- rbind(part.datas, part.datas.2)

#Fit from MLR graph
#jpeg("0601_Real and Fitted, 2016 to 2018.jpeg", width = 8, height = 5, units = 'in', res = 300)
ggplot(data = datas, aes(yymmdd, calls, group = type, colour = type)) +
  geom_line(size = 0.5) +
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.minor = element_line(colour = "grey90"),
        panel.grid.major = element_line(colour = "grey90"),
        panel.grid.major.x = element_line(colour = "grey90"),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = "bold"),
        plot.title = element_text(size = 12, face = "bold")) +
  labs(x = "Date", y = "Daily Calls",
       title = "Fit from Multiple Linear Regression")
#dev.off()

#use prediction
call.lm.pred <- predict(call.lm, valid.df)
options(scipen=999, digits = 3)
accuracy(call.lm.pred, valid.df$calls)


#trial again with outlier elimination & backward elimitation -------------------------------------------------------------------

#box plot to see outliers
boxplot(weather.and.call.nona$calls,outcol = "red", outcex = 1.5, ylab = "CALLS")

#box plot with jitter
boxplot(weather.and.call.nona$calls, outcex = 1.5, ylab = "CALLS")
stripchart(weather.and.call.nona$calls, vertical = TRUE, 
           method = "jitter", add = TRUE, pch = 20, col = 'blue')

#replace outliers with max values
weather.and.call.nona.2 <- weather.and.call.nona
#weather.and.call.nona.2$calls <- sort(weather.and.call.nona.2$calls)
for(i in 1:length(weather.and.call.nona.2$calls)){
  if(weather.and.call.nona.2$calls[i] > quantile(weather.and.call.nona.2$calls,0.75)+1.5*IQR(weather.and.call.nona.2$calls)){
    weather.and.call.nona.2$calls[i] <- max(weather.and.call.nona.2$calls[1:(i-1)])
  }
}

boxplot(weather.and.call.nona.2$calls,outcol = "red", outcex = 1.5, ylab = "CALLS") # no outliers!

#partition the data
set.seed(5)  
train.2.index <- sample(c(1:dim(weather.and.call.nona.2)[1]),    
                      dim(weather.and.call.nona.2)[1]*0.6)  
train.2.df <- weather.and.call.nona.2[train.2.index, ]
valid.2.df <- weather.and.call.nona.2[-train.2.index, ]


#apply backward elimination
call.lm.2 <- lm(calls ~ yymmdd+mintemp+maxtemp+weekday, data = train.2.df, na.action=na.omit)

#model summary
options(scipen = 999)
summary(call.lm.2)

smmr.lm.2 <- summary(call.lm.2)
paste("R-squared: ",
      round(smmr.lm.2$r.squared, 3),
      ", p-value of F test: ",
      1-pf(smmr.lm.2$fstatistic[1], smmr.lm.2$fstatistic[2], smmr.lm.2$fstatistic[3]))


#compare prediction model with original data with ggplot
part.datas <-cbind(train.2.df[,c("calls", "yymmdd")], type="Real")
part.datas.2 <-cbind(data.frame(calls = call.lm.2$fitted.values, yymmdd = train.2.df[, "yymmdd"]), type="Fitted")
datas <- rbind(part.datas, part.datas.2)

#jpeg("0603_Real and Fitted, 2016 to 2018, 2nd trial.jpeg", width = 8, height = 5, units = 'in', res = 300)
ggplot(data = datas, aes(yymmdd, calls, group = type, colour = type)) +
  geom_line(size = 0.5) +
  theme_bw() +
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.minor = element_line(colour = "grey90"),
        panel.grid.major = element_line(colour = "grey90"),
        panel.grid.major.x = element_line(colour = "grey90"),
              axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = "bold"),
        plot.title = element_text(size = 12, face = "bold")) +
  labs(x = "Date", y = "Daily Calls",
       title = "Fit from MLR with backward elimination")+
  scale_y_continuous(labels = comma)
#dev.off()

#use prediction and calculate accuracy
call.lm.2.pred <- predict(call.lm.2, valid.df)
options(scipen=999, digits = 3)
accuracy(call.lm.2.pred, valid.df$calls)

all.residuals.2 <- valid.df$calls - call.lm.2.pred
#length(all.residuals[which(all.residuals > -1406 & 
#                               all.residuals < 1406)])/400
hist(all.residuals.2, breaks = 25, xlab = "Residuals", main =  
       "")

#print the future prediction data  ----------------------------------------------------------------------
#preprocess data
df <- c("calls")
future.df <- seoul.weather19
future.df[,df] <-NA
names(future.df) <- c("yymmdd","mintemp","maxtemp","prec","calls")
#add weekday
sapply(future.df, class)
future.df$weekday <- weekdays(future.df$yymmdd, abbreviate = F)
future.df$weekday <- factor(future.df$weekday, levels = c("Monday", "Tuesday", "Wednesday", 
                                                          "Thursday", "Friday", "Saturday", "Sunday"),
                            ordered = TRUE)
future.df$weekday <- as.integer(future.df$weekday) #1=월, 7=일

future.tree.pred <- predict(call.lm.2, future.df)
future.pred.date <- data.frame("date" = future.df[,"yymmdd"], "calls" = future.tree.pred)


#calendar heatmap
# Create Month Week
library(ggplot2)
library(plyr)
library(scales)
library(zoo)
future.pred.date$yearmonth <- as.yearmon(future.pred.date$date)
future.pred.date$yearmonthf <- factor(future.pred.date$yearmonth)
future.pred.date$monthf<-factor(month(future.pred.date$date),levels=as.character(1:12),labels=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),ordered=TRUE) # finding the month 
future.pred.date$week <- as.numeric(format(future.pred.date$date,"%W")) #finding the week of the year for each date
future.pred.date <- ddply(future.pred.date,.(yearmonthf), transform, monthweek=week-min(week)+1)  # compute week number of month
future.pred.date$weekday = as.POSIXlt(future.pred.date$date)$wday #finding the day no. of the week
future.pred.date$weekdayf<-factor(future.pred.date$weekday,levels=rev(0:6),labels=rev(c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")),ordered=TRUE) #converting the day no. to factor 
future.pred.date$year<-year(future.pred.date$date)
future.pred.date.2 <- future.pred.date[, c("year", "yearmonthf", "week", "monthweek", "weekdayf", "monthf", "week", "calls")]

#Plot
#jpeg("0602_Calendar Heatmap, 2019 June to Aug.jpeg", width = 8, height = 5, units = 'in', res = 300)
ggplot(future.pred.date.2, aes(monthweek, weekdayf, fill = calls)) + 
  geom_tile(colour = "white") + 
  facet_grid(year~monthf) + 
  scale_fill_gradient(low="green", high="red") +
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 10, face = "bold"),
        plot.title = element_text(size = 12, face = "bold")) +
  labs(x="Week of Month",
       y="",
       title = "Time-Series Calendar Heatmap", 
       subtitle="Chicken Delivery Calls (crowdedness)", 
       fill="Close")
#dev.off()


