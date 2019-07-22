# project-chicken
This project tries to create the MLR model to predict future chicken calls from given weather data. This project was created with R. 

Dataset specification:
Merged 2 datasets
- Chicken delivery call data (date, calls) from June 2016 to Nov 2018

source from: SK Telecom. (2018). 18년 5월 서울시 치킨 판매업종 이용 통화량. SK telecom Big Data Hub. 2019년 4월 20일 검색, https://www.bigdatahub.co.kr/product/view.do?pid=1001845

- Seoul weather data

source from: 
서울특별시. (2019). 서울시 일별 기상관측 정보. 서울 열린 데이터 광장. 2019년 6월 2일 검색, https://data.seoul.go.kr/dataList/datasetView.do?infId=OA-2226&srvType=S&serviceKind=1&currentPageNo=1
  AccuWeather. (2019). 중구월 날씨. AccuWeather. 2019년 6월 2일 검색,
https://www.accuweather.com/ko/kr/jung-gu/226007/month/226007?monyr=6/01/2019


Predictors Used:
- Date (yymmdd)
- minimum temperature of the day °C (mintemp)
- maximum temperature of the day °C (maxtemp)
- day of the week 요일 (weekday) 


![alt text](https://github.com/Doyyn/project-chicken/blob/master/0603_Real%20and%20Fitted%2C%202016%20to%202018%2C%202nd%20trial.jpeg)
Used Multiple Linear Regression with outlier elimination and backward elimination.
In this modeling, weather and date including the day of the week were considered as a important variable. Calls were made into barplot to eliminate the outliers. Outliers over the max value were replaced with the max value. 
While the RMSE  are  quite similar to that of other methods, the trend of going up and down is shown better than other methods (regression tree does not show detailed data, neural net make low data lower in extreme ways), so MLR is used to predict. 

![alt text](https://github.com/Doyyn/project-chicken/blob/master/0603_Calendar%20Heatmap%2C%202019%20June%20to%20Aug_MLR.jpeg)
The output of the modeling was created with time-series calendar heatmap.
