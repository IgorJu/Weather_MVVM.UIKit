//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

final class HourlyWeatherViewModel {
    private let hourWeather: HourWeather
    
    init(hourWeather: HourWeather) {
        self.hourWeather = hourWeather
    }
    
    var time: String {
        DateTimeFormatter.formatTime(from: hourWeather.dtTxt)
    }
    
    var minTemp: String {
        String(hourWeather.main.tempMin)
    }
    
    var maxTemp: String {
        String(hourWeather.main.tempMax)
    }

    
    
    var iconName: String {
        hourWeather.weather.first?.icon ?? ""
    }
    
}
