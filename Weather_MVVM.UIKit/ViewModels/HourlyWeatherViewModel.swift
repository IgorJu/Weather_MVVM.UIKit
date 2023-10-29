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
        
    var temperature: String {
        roundToIntAndString(hourWeather.main.temp)
    }

    var visibility: String {
        "⊚ Видимость \(hourWeather.visibility / 1000) км"
    }
    
    var windSpeed: String {
        "Скорость ветра \(hourWeather.wind.speed) м/с"
    }
    
    var iconName: String {
        weatherImage()
    }
    
    private func weatherImage() -> String {
        switch hourWeather.weather.first?.main {
        case .clear:
            return "sun.max.fill"
        case .clouds:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .none:
           return ""
        }
    }

    
}
