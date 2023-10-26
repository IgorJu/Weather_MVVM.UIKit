//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

final class CurrentWeatherCollectionViewCellViewModel {
    
    private let weather: CurrentWeather
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }
    
    var temperature: String {
        if let hourWeather = weather.hourWeather.first {
            let temp = hourWeather.main.temp
            return String(temp)
        } else {
            return ""
        }
    }
    
    var city: String {
        return weather.city.name
    }
    
    var iconName: String {
        var icon = ""
        if let hourWeather = weather.hourWeather.first {
            if let weather = hourWeather.weather.first {
                icon = weather.icon
            } else {
                return ""
            }
        }
        return icon
    }
}
