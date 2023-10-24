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
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private(set) var currentWeather: CurrentWeather?
    private(set) var hourlyWeather: [HourWeather] = []
    private(set) var dailyWeather: [DayWeather] = []
    
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                self.currentWeather = result.currentWeather
                self.dailyWeather = result.dailyForecast.forecast
                self.hourlyWeather = result.hourlyForecast.forecast
                
                completion()
            } catch {
                print(String(describing: error))
            }
        }
    }
}
