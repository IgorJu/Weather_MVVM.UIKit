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
    
    //let city: String
    private var weather: CurrentWeather?
    static let shared = WeatherManager()
        
    private init() {
        
    }
    
    func getCurrentWeather(_ cityName: String, completion: @escaping (CurrentWeather) -> Void) {
        NetworkManager.shared.fetch(
            CurrentWeather.self,
            from: API.cityURL(city: cityName).url
        ) { result in
            switch result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCurrentWeatherByCoordinates(_ lat: Double, _ lon: Double, completion: @escaping (CurrentWeather) -> Void) {
           NetworkManager.shared.fetch(
               CurrentWeather.self,
               from: API.coordURL(lat: String(lat), lon: String(lon)).url
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
