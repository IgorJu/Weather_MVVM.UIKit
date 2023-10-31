//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

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
            return WeatherImages.sun
        case .clouds:
            return WeatherImages.cloud
        case .rain:
            return WeatherImages.rain
        case .none:
            return String()
        }
    }
    
    func getWeatherByCity(_ cityName: String) {
        LocationManager.shared.getCurrentLocation { [weak self] location in
            
            self?.weatherManager.getCurrentWeather(cityName) { [weak self] weather in
                self?.weather.send(weather)
            }
        }
        
    }
    
    func getWeatherBylocation(_ lat: Double, _ lon: Double) {
        LocationManager.shared.getCurrentLocation { [weak self] location in
            
            self?.weatherManager.getCurrentWeatherByCoordinates(
                location.coordinate.latitude,
                location.coordinate.longitude
            ) { [weak self] weather in
                self?.weather.send(weather)
            }
        }
    }
}
