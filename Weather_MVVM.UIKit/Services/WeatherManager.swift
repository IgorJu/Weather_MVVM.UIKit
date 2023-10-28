//
//  WeatherManager.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    
    private var weather: CurrentWeather?
    static let shared = WeatherManager()

    private init() {
        
    }
    
    func getCurrentWeather(completion: @escaping (CurrentWeather) -> Void) {
        NetworkManager.shared.fetch(
            CurrentWeather.self,
            from: API.weatherURL(city: weather?.city.name ?? "Toronto").url
        ) { result in
            switch result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
