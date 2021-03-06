//
//  Constants.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

/**
 *
 * Class contains all the app constaints
 *
 */
class Constants{
    
    public static let FACEBOOK_API_URL = "https://graph.facebook.com/me"
    public static let FACEBOOK_API_KEY = "115509002454606"
    
    private static let WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/"
    
    private static let CURRENT_WEATHER = "weather"
    public static let CURRENT_WEATHER_URL = WEATHER_BASE_URL + CURRENT_WEATHER

    private static let FORECAST = "forecast"
    public static let FORECAST_URL = WEATHER_BASE_URL + FORECAST

    public static let WEATHER_APP_KEY = "48c5211046b770315805a8283b4fef1c"
    
}

