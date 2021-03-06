//
//  CurrentWeatherViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//



import UIKit
/**
 *
 * Contains all the current weather methods
 */
class CurrentWeatherViewController: BaseWeatherViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTitle()
    }
    
    func setTitle(){
        navigationItem.title = "Current Weather"
    }
    
    /**
     * Call the network methods, after the get teh current locatioon
     *
     */
    func getCurrentWeather(){
        showProgressDialog()
        Location.getLocation(accuracy: .room, frequency: .oneShot, success: { (_, location) -> (Void) in
            let late = String(location.coordinate.latitude)
            let long = String(location.coordinate.longitude)
            
            print(late)
            print(long)
            
            CurrentWeatherNetworkRequest().getCurrentWeather(appKey: Constants.WEATHER_APP_KEY,
                                                             late: late,
                                                             long: long,
                                                             tempUnits: "imperial",
                                                             onSuccess: { [weak self](response) in
                                                                self?.setCurrentWeatherData(response)
                                                                self?.hideProgressDialog()
            },
                                                             onError: {  [weak self] error in
                                                                self?.hideProgressDialog()
            })
            
        }) {[weak self] (request, lastLocation, error) -> (Void) in
            request.cancel()
            self?.hideProgressDialog()
            AppUtils.showErrorMessage("Location monitoring failed due to an error \(error)")
        }
    }
    
    /**
     * Call the base current weather vuew to set the data
     *
     */
    func setCurrentWeatherData(_ response: CurrentWeatherResponse){
        setPressure(response.weatherData)
        setTemp(response.weatherData)
        setHudimity(response.weatherData)
        setMinTemp(response.weatherData)
        setMaxTemp(response.weatherData)
        setSeaLevel(response.weatherData)
        setGrandLevel(response.weatherData)
        setWindSpeeed(response.wind)
        setWeatherSys(response.weatherSys)
        setWeatherState(response.weatherState)
    }
    
}
