# project-chicken
This project tries to create the MLR model to predict future chicken calls from given weather data. This project was created with R. 

Dataset specification:
Merged 2 datasets
- Chicken delivery call data (date, calls)
- Seoul weather data

Predictors Used:
- Date (yymmdd)
- minimum temperature of the day °C (mintemp)
- maximum temperature of the day °C (maxtemp)
- day of the week 요일 (weekday) 

Used Multiple Linear Regression with outlier elimination and backward elimination.
In this modeling, weather and date including the day of the week were considered as a important variable. Calls were made into barplot to eliminate the outliers. Outliers over the max value were replaced with the max value. 
While the RMSE  are  quite similar to that of other methods, the trend of going up and down is shown better than other methods (regression tree does not show detailed data, neural net make low data lower in extreme ways), so MLR is used to predict. 

The output of the modeling was created with time-series calendar heatmap.
