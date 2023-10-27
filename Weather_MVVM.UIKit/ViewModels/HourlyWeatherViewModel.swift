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
        hourWeather.dtTxt
    }
    
    var temperature: String {
        String(hourWeather.main.temp)
    }
    
    
    var iconName: String {
        hourWeather.weather.first?.icon ?? ""
    }
    
}
