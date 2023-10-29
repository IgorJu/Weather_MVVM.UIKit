//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation
import Combine
import UIKit

final class CurrentWeatherViewModel {
    
    var weather: CurrentValueSubject<CurrentWeather?, Never> = CurrentValueSubject(nil)
    
    
    private let weatherManager = WeatherManager.shared
    
    var feelsLike: String {
        "Ощущается как \(roundToIntAndString(weather.value?.list.first?.main.feelsLike ?? 0))"
    }
    
    var temperature: String {
        roundToIntAndString(weather.value?.list.first?.main.temp ?? 4)
    }
    
    var city: String {
        return weather.value?.city.name ?? "City"
    }
    
    var iconName: String {
        weatherImage()
    }
    
    private func weatherImage() -> String {
        switch weather.value?.list.first?.weather.first?.main {
        case .clear:
            return "sun.max"
        case .clouds:
            return "cloud"
        case .rain:
            return "cloud.rain"
        case .none:
           return ""
        }
    }
    
    func getLocation() {
        LocationManager.shared.getCurrentLocation { [weak self] location in
            print(location)
            self?.weatherManager.getCurrentWeather { [weak self] weather in
                self?.weather.send(weather)
            }
        }
    }
    
}
