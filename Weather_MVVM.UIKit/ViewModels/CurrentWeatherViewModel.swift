//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

final class CurrentWeatherViewModel {
    
    var weather: Bindable<CurrentWeather>?
                            
     func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(location)
            WeatherManager.shared.getCurrentWeather(completion: { weather in
                self.weather?.value = weather
            })
        }
    }

        
    var temperature: String {
        if let hourWeather = weather?.value.hourWeather.first {
            let temp = hourWeather.main.temp
            return String(temp)
        } else {
            return ""
        }
    }
    
    var city: String {
        return weather?.value.city.name ?? "City"
    }
    
    var iconName: String {
        var icon = ""
        if let hourWeather = weather?.value.hourWeather.first {
            if let weather = hourWeather.weather.first {
                icon = weather.icon
            } else {
                return ""
            }
        }
        return icon
    }
}
