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
        NetworkManager.shared.fetch(CurrentWeather.self, from: API.weatherURL.url) { result in
            switch result {
                
            case .success(let weather):
                print(weather)
                completion(weather)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
//    func fetchWeather() async -> CurrentWeather  {
//            do {
//                 weather = try await NetworkManager.shared.fetchWeather()
//                print(weather)
//                await MainActor.run {
//                }
//            } catch {
//                print(error)
//            }
//        return weather!
//
//    }

    
//    func getWeather(for location: CLLocation, completion: @escaping () -> Void) -> CurrentWeather {
//        NetworkManager.shared.fetch(CurrentWeather.self, from: API.weatherURL.url) { [weak self] result in
//            let weather: CurrentWeather
//                    switch result {
//                    case .success(let fethingWeather):
//                        weather = fethingWeather
//                    case .failure(let error):
//                        print(error)
//                    }
//            return weather
//                }
//            }
    
}
