//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation
import Combine

final class CurrentWeatherViewModel {
    
    var weather: CurrentValueSubject<CurrentWeather?, Never> = CurrentValueSubject(nil)

    
    private let weatherManager = WeatherManager.shared
    
    
    
    var temperature: String {
        return String(weather.value?.list.first?.main.temp ?? 4)
    }
    
    var city: String {
        return weather.value?.city.name ?? "City"
    }
    
    var iconName: String {
        return weather.value?.list.first?.weather.first?.icon ?? "sun.max"
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
