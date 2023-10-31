//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

private enum weatherStrings {
    static let visibility = "⊚ Видимость"
    static let windSpeed = "Скорость ветра"
}

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
        "\(weatherStrings.visibility) \(hourWeather.visibility / 1000) км"
    }
    
    var windSpeed: String {
        "\(weatherStrings.windSpeed) \(hourWeather.wind.speed) м/с"
    }
    
    var iconName: String {
        weatherImage()
    }
    
    private func weatherImage() -> String {
        switch hourWeather.weather.first?.main {
        case .clear:
            return WeatherImages.sun
        case .clouds:
            return WeatherImages.cloud
        case .rain:
            return WeatherImages.rain
        case .none:
           return String()
        }
    }

    
}
