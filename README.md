# Weather App

A simple flutter web app that display the forecast for the next 5 days.
The app uses the [metaweather](https://www.metaweather.com/api/) api.

## Running the application

1. Set API proxy
MetaWeather API doesn't support CORS, to make the app work properly you can setup a proxy server to serve the data.
I built one using Express.js, check the instructions [here](https://github.com/OtavioHo/meta_weather_proxy)

2. Clone repository
```
git clone https://github.com/OtavioHo/weather_forecast_flutter
```

3. cd into folder
```
cd weather_forecast_flutter
```

4. Run App
```
flutter run 
``` 